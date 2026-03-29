#!/usr/bin/env bash

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/env.sh"

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
        "$@"
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
        trap - EXIT
        kill "$SUDO_PID" 2>/dev/null || true
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

# Function to set a preference value in a plist file
plist_write() {
    local key="$1"
    local type="$2"
    local value="$3"
    local plist="$4"

    if /usr/libexec/PlistBuddy -c "Print :'$key'" "$plist" &>/dev/null; then
        /usr/libexec/PlistBuddy -c "Set :'$key' $value" "$plist"
    else
        /usr/libexec/PlistBuddy -c "Add :'$key' $type $value" "$plist"
    fi
}

# Function to overwrite contents of a plist file with another plist file
# Needed because you should not just overwrite files in Library/Preferences
plist_overwrite() {
    local source="$1"
    local destination="$2"

    /usr/libexec/PlistBuddy -c "Clear dict" "$destination"
    /usr/libexec/PlistBuddy -c "Merge '$source'" "$destination"
}

# Set a preference value
defaults_write() {
    local file=$1
    local key=$2
    local type=$3
    local value=$4

    if [[ "$key" == *.* ]]; then
        local tmpfile
        tmpfile=$(mktemp)
        defaults export "$file" "$tmpfile"

        # Ensure parent dictionaries exist along the key path
        IFS='.' read -ra parts <<< "$key"
        local path=""
        for ((i=0; i<${#parts[@]}-1; i++)); do
            path="${path:+$path.}${parts[$i]}"
            plutil -insert "$path" -dictionary "$tmpfile" 2>/dev/null || true
        done

        plutil -replace "$key" "$type" "$value" "$tmpfile" 2>/dev/null ||
            plutil -insert "$key" "$type" "$value" "$tmpfile"

        defaults import "$file" "$tmpfile"
        rm -f "$tmpfile"
    else
        defaults write "$file" "$key" "$type" "$value"
    fi
}
