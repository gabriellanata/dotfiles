#!/usr/bin/env bash

set -euo pipefail

link_file "$DOTFILES_DIR/configs/tmux/tmux.conf" "$HOME/.tmux.conf"
link_file "$DOTFILES_DIR/configs/tmux/ressurect" "$HOME/.tmux/resurrect"

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    log "Installing Tmux Plugin Manager..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi