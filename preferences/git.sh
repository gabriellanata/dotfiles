#!/usr/bin/env bash

link_file "$DOTFILES_DIR/gitconfig" "$HOME/.gitconfig"

git config --global core.excludesfile "$DOTFILES_DIR/.gitignore"
git config --global maintenance.repo "$SRC_DIR/Lyft-iOS"

gh extension install github/gh-copilot
gh extension install dlvhdr/gh-dash