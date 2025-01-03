#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration arrays
# Format: "source_path:target_path"
FILES_TO_LINK=(
    "zshrc:.zshrc"
    "gitconfig:.gitconfig"
)

DIRS_TO_LINK=(
    "bin:bin"
    "zsh:.oh-my-zsh/custom/zsh"
    "xcode/keybindings:Library/Developer/Xcode/UserData/KeyBindings"
    "xcode/themes:Library/Developer/Xcode/UserData/FontAndColorThemes"
    "xcode/snippets:Library/Developer/Xcode/UserData/CodeSnippets"
)

ZSH_PLUGINS=(
    "zsh-syntax-highlighting:https://github.com/zsh-users/zsh-syntax-highlighting.git"
    "zsh-autosuggestions:https://github.com/zsh-users/zsh-autosuggestions.git"
)

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

command_exists() {
    command -v "$1" >/dev/null 2>&1
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
    success "Linked $src to $dest"
}

install_homebrew() {
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

install_packages() {
    log "Installing packages from Brewfile..."
    brew bundle --force cleanup --file="$DOTFILES_DIR/Brewfile"
    success "Packages installed"
}

install_oh_my_zsh() {
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        log "Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
        success "Oh My Zsh installed"
    else
        success "Oh My Zsh already installed"
    fi
    
    log "Installing zsh plugins..."
    ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
    mkdir -p "$ZSH_CUSTOM/plugins"
    
    for plugin_pair in "${ZSH_PLUGINS[@]}"; do
        IFS=':' read -r name repo <<< "$plugin_pair"
        if [ ! -d "$ZSH_CUSTOM/plugins/$name" ]; then
            git clone "$repo" "$ZSH_CUSTOM/plugins/$name"
            success "Installed $name plugin"
        else
            success "$name plugin already installed"
        fi
    done
}

create_symlinks() {
    log "Creating symbolic links..."
    
    # Link files
    for file_pair in "${FILES_TO_LINK[@]}"; do
        IFS=':' read -r src dest <<< "$file_pair"
        link_file "$DOTFILES_DIR/$src" "$HOME/$dest"
    done
    
    # Link directories
    for dir_pair in "${DIRS_TO_LINK[@]}"; do
        IFS=':' read -r src dest <<< "$dir_pair"
        link_file "$DOTFILES_DIR/$src" "$HOME/$dest"
    done
    
    success "All symbolic links created"
}

setup_permissions() {
    log "Setting up permissions..."
    
    # Make all scripts in bin executable
    if [ -d "$HOME/bin" ]; then
        chmod +x "$HOME/bin"/*
        success "Made bin scripts executable"
    fi
}

setup_preferences() {
    log "Setting up preferences..."

    # Close open System Preferences panes, to prevent them from overriding settings.
    osascript -e 'tell application "System Preferences" to quit'
    
    # Run scripts
    preferences="$DOTFILES/preferences/*.sh"
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

    success "Done. Note that some of these changes require a logout/restart to take effect."
}

main() {
    log "Starting dotfiles installation..."

    # Ask for the administrator password upfront
    sudo -v

    # Keep-alive: update existing 'sudo' time stamp until '.osx' has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
    
    # install_homebrew
    # install_packages
    # install_oh_my_zsh
    # create_symlinks
    # setup_permissions
    setup_preferences
    restart_processes
    
    if [ -f "$HOME/.zshrc" ]; then
        source "$HOME/.zshrc"
    fi
    
    success "Installation complete! Please restart your terminal."
}

main