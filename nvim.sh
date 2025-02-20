#!/bin/bash
#
#
#Shell script for installing the nightly release package on Debian-based operating systems.
#
## Features
#
#1. Checks the latest nightly version
#2. Compares currently installed version
#3. Creates `/tmp` directories to download the binaries
#4. Compares the checksum
#5. Extracts the tar file
#6. Reconfigure the directories to install in `usr/local/`
#7. Creates the `DEBIAN/control` file
#8. Creates the deb package
#9. Removes the currently installed neovim package (not neovim-runtime)
#10. Installs the new deb package
#
## Installation
#
#Run command:
#
#```sh
#sudo ./nvim.sh
#```

# Exit on errors
set -e

REPO="neovim/neovim"
INSTALL_DIR="/usr/local"
PKG_NAME="neovim"
ARCH="amd64"
TAR_FILE="nvim-linux-x86_64.tar.gz"
CHECKSUM_FILE="shasum.txt"

# Get latest release tag from GitHub
LATEST_VERSION=$(curl -s "https://api.github.com/repos/$REPO/releases/tags/nightly" | jq -r .body | sed -n 's/.*\bv\([0-9.]*\).*/\1/p')

# Validate extracted version
if [[ ! "$LATEST_VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Invalid version retrieved: $LATEST_VERSION"
  exit 1
fi

# Get installed version
INSTALLED_VERSION=$($INSTALL_DIR/bin/nvim --version | head -n1 | awk '{print $2}' | sed 's/^v//')

# Compare versions
if [ "$LATEST_VERSION" = "$INSTALLED_VERSION" ]; then
  echo "Neovim is already up to date (version $INSTALLED_VERSION)."
  exit 0
fi

echo "Updating Neovim from $INSTALLED_VERSION to $LATEST_VERSION..."

# Download latest release
TMP_DIR="/tmp/${PKG_NAME}_${LATEST_VERSION}"
DEB_DIR="$TMP_DIR/nvim-linux-x86_64"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR"
sudo curl -LO "https://github.com/$REPO/releases/download/nightly/$TAR_FILE"
sudo curl -LO "https://github.com/$REPO/releases/download/nightly/$CHECKSUM_FILE"

# prevent checksun mismatch
grep "$TAR_FILE" "$CHECKSUM_FILE" > "$CHECKSUM_FILE.filtered"
mv "$CHECKSUM_FILE.filtered" "$CHECKSUM_FILE"

sha256sum -c "$CHECKSUM_FILE" || {
  echo "Checksum verification failed!"
  exit 1
}

# local config
tar xzf "$TAR_FILE"
cd "nvim-linux-x86_64"
sudo mkdir -p "$DEB_DIR/DEBIAN" "$DEB_DIR/usr/local"
sudo mv "bin" "usr/local"
sudo mv "lib" "usr/local"
sudo mv "share" "usr/local"

sudo cat <<EOF > "$DEB_DIR/DEBIAN/control"
Package: $PKG_NAME
Version: $LATEST_VERSION
Section: editors
Priority: optional
Architecture: $ARCH
Depends: libc6 (>= 2.29)
Maintainer: avargas05 <avargas05.github@outlook.com>
Description: heavily refactored vim fork (nightly)
EOF

dpkg-deb --build "$DEB_DIR"

# verify versions
sudo apt remove -y neovim
sudo dpkg -i "$DEB_DIR.deb"

echo "Removing temporary files"
sudo rm -rf "$TMP_DIR"

echo "Neovim $LATEST_VERSION installed successfully."

