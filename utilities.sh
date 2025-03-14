#!/usr/bin/env bash

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
            y|Y ) return 0;;
            n|N ) return 1;;
            * ) echo "Invalid input. Please enter y or n.";;
        esac
    done
}

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

if_sudo_active() {
    if [[ "$EUID" -eq 0 ]]; then
        eval "$@"
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

# Set a preference value
function defaults_write() {
    local file=$1
    local key=$2
    local type=$3
    local value=$4
    
    # if the key has a dot, we need to use plutil to set the value
    if [[ "$key" == *.* ]]; then
        defaults export "$file" - |
            plutil -replace "$key" "$type" "$value" -o - - |
            defaults import "$file" -
    else
        defaults write "$file" "$key" "$type" "$value"
    fi
}

# Set a preference value
function defaults_read() {
    local file=$1
    local key=$2
    # if the key has a dot, we need to use plutil to set the value
    if [[ "$key" == *.* ]]; then
        defaults export "$file" - |
            plutil -extract "$key" - -
    else
        defaults read "$file" "$key"
    fi
}