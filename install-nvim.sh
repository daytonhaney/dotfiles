#!/bin/bash
set -euo pipefail

REPO="neovim/neovim"
PKG_NAME="neovim"
INSTALL_PREFIX="/usr/local"
TMP_DIR=""
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log()   { echo -e "${GREEN} $1${NC}"; }
warn()  { echo -e "${YELLOW}Warning: $1${NC}"; }
error() { echo -e "${RED}Error: $1${NC}" >&2; exit 1; }

for cmd in curl tar sudo; do
    command -v "$cmd" >/dev/null || error "$cmd not found. Install: sudo apt install $cmd"
done

log "Installing Neovim Nightly..."


# Stable version 
# ASSETS_URL="https://api.github.com/repos/$REPO/releases/latest"
# Nightly version
# ASSETS_URL="https://api.github.com/repos/$REPO/releases/tags/nightly"

TAR_URL="https://github.com/$REPO/releases/download/nightly/nvim-linux-x86_64.tar.gz"
TAR_FILE="nvim-linux-x86_64.tar.gz"
EXTRACT_DIR="nvim-linux-x86_64"

# Create
TMP_DIR=$(mktemp -d "/tmp/${PKG_NAME}_XXXXXXX")
trap 'rm -rf "$TMP_DIR"' EXIT
cd "$TMP_DIR"

log "Downloading $TAR_FILE..."
curl -L --fail -o "$TAR_FILE" "$TAR_URL" || error "Download failed"

# Size check (catch 404s)
FILE_SIZE=$(stat -c%s "$TAR_FILE" 2>/dev/null || wc -c < "$TAR_FILE")
[[ $FILE_SIZE -gt 10000000 ]] || error "File too small ($FILE_SIZE bytes) — likely 404"

log "Extracting..."
tar xzf "$TAR_FILE" || error "Extract failed"

[[ -d "$EXTRACT_DIR" ]] || error "Extract dir not found"
[[ -f "$EXTRACT_DIR/bin/nvim" ]] || error "nvim binary missing"

log "Installing to $INSTALL_PREFIX..."
sudo rm -rf \
    "$INSTALL_PREFIX/bin/nvim" \
    "$INSTALL_PREFIX/lib/nvim" \
    "$INSTALL_PREFIX/share/nvim" \
    /usr/bin/nvim

sudo mkdir -p "$INSTALL_PREFIX/bin" "$INSTALL_PREFIX/lib" "$INSTALL_PREFIX/share"

sudo cp -r "$EXTRACT_DIR/bin"/*     "$INSTALL_PREFIX/bin/"   || error "Copy bin failed"
sudo cp -r "$EXTRACT_DIR/lib"/*     "$INSTALL_PREFIX/lib/"   || error "Copy lib failed"
sudo cp -r "$EXTRACT_DIR/share"/*   "$INSTALL_PREFIX/share/" || error "Copy share failed"

log "Symlinking /usr/bin/nvim..."
sudo ln -sf "$INSTALL_PREFIX/bin/nvim" /usr/bin/nvim || error "Symlink failed"

log "House Keeping..."
rm -rf "$TMP_DIR"

log "Neovim Nightly Installed!"
echo

# Test
if [ -x "$INSTALL_PREFIX/bin/nvim" ]; then
    "$INSTALL_PREFIX/bin/nvim" --version | head -n 2
    echo
    log "Run: nvim"
    log "If not found: export PATH=\"/usr/bin:\$PATH\" && hash -r"
else
    error "nvim binary missing after install"
fi
