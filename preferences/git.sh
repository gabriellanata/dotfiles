#!/usr/bin/env bash

set -euo pipefail

log "Linking git configuration..."
link_file "$DOTFILES_DIR/gitconfig" "$HOME/.gitconfig"
