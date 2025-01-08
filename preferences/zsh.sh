#!/usr/bin/env bash

set -euo pipefail

ZSH_PLUGINS=(
    "zsh-syntax-highlighting:https://github.com/zsh-users/zsh-syntax-highlighting.git"
    "zsh-autosuggestions:https://github.com/zsh-users/zsh-autosuggestions.git"
)

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    log "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    success "Oh My Zsh installed"
else
    success "Oh My Zsh already installed"
fi

link_file "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
link_file "$DOTFILES_DIR/zsh" "$HOME/.oh-my-zsh/custom/zsh"

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
