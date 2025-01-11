#!/usr/bin/env bash

set -euo pipefail

# We should copy this instead of linking it because it can cause crashes
cp -R "$DOTFILES_DIR/configs/keyboard/Gabriel.bundle" "$HOME/Library/Keyboard Layouts/"

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Enable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool true
# Enable auto capitalize
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool true
# Disable auto period insert
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3