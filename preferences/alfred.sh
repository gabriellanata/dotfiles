#!/usr/bin/env bash

link_file "$DOTFILES_DIR/configs/alfred/Alfred.alfredpreferences" "$HOME/Library/Application Support/Alfred/Alfred.alfredpreferences"

# Show Spotlight search (conflicts with Alfred)
defaults_write com.apple.symbolichotkeys AppleSymbolicHotKeys.64.enabled -bool NO
# Show Finder search window
defaults_write com.apple.symbolichotkeys AppleSymbolicHotKeys.65.enabled -bool NO
