#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$DOTFILES_DIR/utilities.sh"

setup_developer_tools() {
    xcode-select --install || true
    success "Developer tools installed"
}

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

    if ! op whoami; then
        op signin
    else
        success "1Password CLI already set up"
    fi
}

setup_xcode() {
    if ! command_exists xcodes; then
        log "Installing Xcodes..."
        brew install xcodes-cli
        success "Xcodes installed"
    else
        success "Xcodes already installed"
    fi

    if [ ! -d "/Applications/Xcode.app" ]; then
        log "Installing Xcode..."
        "$DOTFILES_DIR/bin/x-install"
        success "Xcode installed"
    else
        success "Xcode already installed"
    fi
}

setup_git() {
    if ! command_exists gh; then
        log "Installing GitHub CLI..."
        brew install gh
        success "GitHub CLI installed"
    else
        success "GitHub CLI already installed"
    fi

    if ! git ls-remote -h "https://github.com/gabriellanata/private" &>/dev/null; then
        log "Ensure Git is logged in"
    else
        success "Git already logged in"
    fi
}

setup_developer_tools
setup_homebrew
setup_1password
setup_git
setup_xcode
success "Setup complete!"
