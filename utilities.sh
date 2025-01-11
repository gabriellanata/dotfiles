#!/usr/bin/env bash

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions
log() {
    echo -e "${BLUE}==>${NC} $1"
}

success() {
    echo -e "${GREEN}==>${NC} $1"
}

error() {
    echo -e "${RED}==>${NC} $1"
}

ask() {
    while true; do
        read -rn 1 -rp "$1 (y/n)? " choice
        echo
        case "$choice" in 
            y|Y ) return 1;;
            n|N ) return 2;;
            * ) echo "Invalid input. Please enter y or n.";;
        esac
    done
}

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

if_sudo_active() {
    if sudo -nv 2>/dev/null; then
        eval "$1"
    fi
}

sudo_start() {
    sudo -v
    ( while true; do sudo -v; sleep 50; done; ) &
    SUDO_PID=$!
    trap 'kill $SUDO_PID' EXIT
}

sudo_stop() {
    if [ -n "${SUDO_PID:-}" ]; then
        kill "$SUDO_PID"
        trap - SIGINT SIGTERM
        sudo -k
    fi
}

link_file() {
    local src="$1"
    local dest="$2"
    local dest_dir
    dest_dir=$(dirname "$dest")
    
    if [ ! -d "$dest_dir" ]; then
        mkdir -p "$dest_dir"
    fi
    
    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        local backup
        backup="${dest}.backup.$(date +%s)"
        log "Backing up $dest to $backup"
        mv "$dest" "$backup"
    fi
    
    ln -sfn "$src" "$dest"
    success "Linked $(echo "$src to $dest" | sed "s|$DOTFILES_DIR|.|; s|$HOME|~|")"
}
