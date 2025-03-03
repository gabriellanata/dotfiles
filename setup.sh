#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$DOTFILES_DIR/utilities.sh"

setup_homebrew() {
    if ! command_exists brew; then
        log "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        if [[ $(uname -m) == 'arm64' ]]; then
            echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
            eval "$(/opt/homebrew/bin/brew shellenv)"
        fi
        success "Homebrew installed"
    else
        success "Homebrew already installed"
    fi
}

setup_1password() {
    if ! command_exists op; then
        log "Installing 1Password..."
        brew install --cask 1password@beta
        brew install --cask 1password-cli
        success "1Password installed"
    else
        success "1Password already installed"
    fi
}

setup_xcode() {
    if ! command_exists xcodes; then
        log "Installing Xcodes..."
        brew install xcodes
        success "Xcodes installed"
    else
        success "Xcodes already installed"
    fi

    if [ ! -d "/Applications/Xcode.app" ]; then
        log "Installing Xcode..."
        xcodes install --latest --experimental-unxip
        success "Xcode installed"
    else
        success "Xcode already installed"
    fi
}

setup_homebrew
setup_1password
setup_xcode

success "Setup complete! Ensure you're logged in to your apple account, 1Password, and Xcodes."
