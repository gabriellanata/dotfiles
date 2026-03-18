#!/usr/bin/env bash

# Add `code` and `cursor` to path if available
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:/Applications/Cursor.app/Contents/Resources/app/bin"

# Shared settings and keybindings for VSCode and Cursor
VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User"
CURSOR_USER_DIR="$HOME/Library/Application Support/Cursor/User"

for user_dir in "$VSCODE_USER_DIR" "$CURSOR_USER_DIR"; do
    link_file "$DOTFILES_DIR/configs/vscode/settings.json" "$user_dir/settings.json"
    link_file "$DOTFILES_DIR/configs/vscode/keybindings.json" "$user_dir/keybindings.json"
done
