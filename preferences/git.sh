#!/usr/bin/env bash

link_file "$DOTFILES_DIR/gitconfig" "$HOME/.gitconfig"

git config --global core.excludesfile "$DOTFILES_DIR/.gitignore"
git config --global maintenance.repo "$SRC_DIR/Lyft-iOS"
git config --global maintenance.repo "$SRC_DIR/Lanata-Server"
git config --global maintenance.repo "$SRC_DIR/gearboxapi"

gh extension install github/gh-copilot
gh extension install dlvhdr/gh-dash
gh extension install github/gh-skyline
