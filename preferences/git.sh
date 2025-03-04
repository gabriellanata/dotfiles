#!/usr/bin/env bash

link_file "$DOTFILES_DIR/gitconfig" "$HOME/.gitconfig"

gh extension install github/gh-copilot
gh extension install dlvhdr/gh-dash