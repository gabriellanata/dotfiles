#!/usr/bin/env bash

set -euo pipefail

log "Linking bin configuration..."
link_file "$DOTFILES_DIR/bin" "$HOME/bin"

log "Setting up bin permissions..."
if [ -d "$HOME/bin" ] && [ "$(ls "$HOME/bin")" ]; then
    chmod +x "$HOME/bin"/*
    success "Made bin scripts executable"
fi
