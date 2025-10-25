#!/bin/bash

# Neovim Nightly installer
# Debian 13 - Trixie

set -euo pipefail

REPO="neovim/neovim"
PKG_NAME="neovim"
ARCH="x86_64"
INSTALL_PREFIX="/usr/local"
TMP_DIR=""
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log() {
    echo -e "${GREEN}➜ $1${NC}"
}

warn() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

error() {
    echo -e "${RED}✖ $1${NC}" >&2
}

# Check required tools
for cmd in curl jq tar sha256sum sudo; do
    if ! command -v "$cmd" &> /dev/null; then
        error "$cmd is required but not installed. Install with: sudo apt install $cmd"
        exit 1
    fi
done

log "Fetching latest Neovim nightly info..."
ASSETS_URL="https://api.github.com/repos/$REPO/releases/tags/nightly"
RELEASE_INFO=$(curl -s -L --retry 1 --retry-delay 2 "$ASSETS_URL" || {
    error "Curl failed to fetch release info. Check network or rate limit."
    exit 1
})

# Debug: Always print if JSON is empty or invalid
if [[ -z "$RELEASE_INFO" || "$RELEASE_INFO" == "" ]]; then
    error "Empty response from GitHub API. Possible rate limit—wait 1 hour or try VPN."
    exit 1
fi

# Quick check: Is this valid JSON? (jq will error if not)
if ! echo "$RELEASE_INFO" | jq empty > /dev/null 2>&1; then
    error "Invalid JSON from GitHub API. Raw response:"
    echo "$RELEASE_INFO"
    exit 1
fi

log "API response valid. Parsing assets..."

# Get actual asset names
TAR_URL=$(echo "$RELEASE_INFO" | jq -r '.assets[] | select(.name | contains("nvim-linux-x86_64.tar.gz")) | .browser_download_url')
if [[ -z "$TAR_URL" || "$TAR_URL" == "null" ]]; then
    error "Could not find nvim-linux-x86_64.tar.gz in nightly release."
    warn "Debug: Available Linux assets in this response:"
    echo "$RELEASE_INFO" | jq -r '.assets[]? | select(.name | contains("linux")) | .name' || echo "No assets found—full JSON below for inspection:"
    echo "$RELEASE_INFO" | jq '.assets[]? | {name: .name}'  # Pretty-print assets
    exit 1
fi

# FIXED: Extract inline SHA256 hash from API (no separate file)
EXPECTED_SHA256=$(echo "$RELEASE_INFO" | jq -r '.assets[] | select(.name | contains("nvim-linux-x86_64.tar.gz")) | .sha256')
if [[ -z "$EXPECTED_SHA256" || "$EXPECTED_SHA256" == "null" ]]; then
    warn "No inline SHA256 found in API—skipping verification (download anyway)."
    EXPECTED_SHA256=""
else
    log "Found expected SHA256: ${EXPECTED_SHA256:0:16}..."  # Truncate for log
fi

TAR_FILE=$(basename "$TAR_URL")
EXTRACT_DIR="nvim-linux-x86_64"

log "Latest nightly asset: $TAR_FILE"

# Create temp dir
TMP_DIR=$(mktemp -d "/tmp/${PKG_NAME}_XXXXXXX")
trap 'rm -rf "$TMP_DIR"' EXIT
cd "$TMP_DIR"

log "Downloading Neovim nightly..."
curl -L -o "$TAR_FILE" "$TAR_URL"

# FIXED: Verify using inline SHA256
if [[ -n "$EXPECTED_SHA256" ]]; then
    log "Verifying checksum..."
    COMPUTED_SHA256=$(sha256sum "$TAR_FILE" | cut -d' ' -f1)
    if [[ "$COMPUTED_SHA256" != "$EXPECTED_SHA256" ]]; then
        error "Checksum verification failed! Expected: $EXPECTED_SHA256, Got: $COMPUTED_SHA256"
        exit 1
    fi
    log "Checksum verified: OK"
else
    warn "Skipping checksum (no inline hash available)"
fi

log "Extracting archive..."
tar xzf "$TAR_FILE"

if [[ ! -d "$EXTRACT_DIR" ]]; then
    error "Expected directory $EXTRACT_DIR not found after extraction."
    ls -la  # Debug: Show what's actually extracted
    exit 1
fi

log "Removing old Neovim installation (if any)..."
sudo rm -rf \
    "$INSTALL_PREFIX/bin/nvim" \
    "$INSTALL_PREFIX/lib/nvim" \
    "$INSTALL_PREFIX/share/nvim" \
    /usr/bin/nvim

log "Installing Neovim to $INSTALL_PREFIX..."
sudo mkdir -p "$INSTALL_PREFIX/bin" "$INSTALL_PREFIX/lib" "$INSTALL_PREFIX/share"
sudo cp -r "$EXTRACT_DIR/bin"/* "$INSTALL_PREFIX/bin/"
sudo cp -r "$EXTRACT_DIR/lib"/* "$INSTALL_PREFIX/lib/"

sudo cp -r "$EXTRACT_DIR/share"/* "$INSTALL_PREFIX/share/"
log "Creating symlink /usr/bin/nvim → $INSTALL_PREFIX/bin/nvim..."

sudo ln -sf "$INSTALL_PREFIX/bin/nvim" /usr/bin/nvim
log "Setting executable permissions..."

sudo chmod +x "$INSTALL_PREFIX/bin/nvim"
log "Cleaning up temporary files..."

rm -rf "$TMP_DIR"
log "Neovim nightly installed successfully!"

echo
if command -v nvim &> /dev/null; then
    nvim --version | head -n 2
else
    error "nvim command still not found in PATH. Check /usr/bin/nvim and your PATH."
    exit 1
fi