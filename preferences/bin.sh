#!/usr/bin/env bash

set -euo pipefail

link_file "$DOTFILES_DIR/bin" "$HOME/bin"

if [ -d "$HOME/bin" ] && [ "$(ls "$HOME/bin")" ]; then
    chmod +x "$HOME/bin"/*
    success "Made bin scripts executable"
fi
