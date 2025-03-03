#!/usr/bin/env bash

set -euo pipefail

link_file "$DOTFILES_DIR/configs/cursor/settings.json" "$HOME/Library/Application Support/Cursor/User/settings.json"
link_file "$DOTFILES_DIR/configs/cursor/keybindings.json" "$HOME/Library/Application Support/Cursor/User/keybindings.json"
