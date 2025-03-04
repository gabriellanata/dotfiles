#!/usr/bin/env bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$DOTFILES_DIR/utilities.sh"

setup_ssh() {
    log "Setting up SSH..."
    source "$DOTFILES_DIR/preferences/ssh.sh"
    success "SSH set up"
}

setup_gitconfig() {
    log "Setting up Git config..."
    source "$DOTFILES_DIR/preferences/git.sh"
    success "Git config set up"
}

setup_developer_tools() {
    success "Installing developer tools..."
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

    if ! eval "$(op signin)"; then
        success "1Password CLI  logged in"
    else
        success "1Password CLI already logged in"
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

    if ! gh auth status &>/dev/null; then
        gh auth login
        success "Git logged in"
    else
        success "Git already logged in"
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

setup_ssh
setup_gitconfig
setup_developer_tools
setup_homebrew
setup_1password
setup_git
setup_xcode
success "Setup complete!"
