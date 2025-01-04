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
    
    log "Installing packages from Brewfile..."
    brew bundle --force cleanup --file="$DOTFILES_DIR/Brewfile"
    success "Packages installed"
}

setup_preferences() {
    log "Setting up preferences..."

    # Close open System Preferences panes, to prevent them from overriding settings.
    osascript -e 'tell application "System Preferences" to quit'
    
    # Run scripts
    preferences="$DOTFILES_DIR/preferences/*.sh"
    for file in ${preferences}; do
        # shellcheck source=/dev/null
        source "$file"
    done

    success "All preferences configured"
}

restart_processes() {    
    log "Restarting processes.. "

    for app in "Address Book" "Calendar" "Contacts" "Dashboard" "Dock" "Finder" \
        "Mail" "Safari" "SystemUIServer" "Terminal" "iCal" "iTunes" "Activity Monitor"; do
        killall "$app" > /dev/null 2>&1 || true
    done

    if [ -f "$HOME/.zshrc" ]; then
        source "$HOME/.zshrc"
    fi

    success "Done. Note that some of these changes require a logout/restart to take effect."
}

log "Starting dotfiles installation..."

sudo -v # Ask for the administrator password upfront and Keep-alive
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

setup_homebrew
setup_preferences
restart_processes

success "Installation complete! Please restart your terminal."
