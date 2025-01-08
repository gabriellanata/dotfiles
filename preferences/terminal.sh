#!/usr/bin/env bash

set -euo pipefail

# Only use UTF-8 in Terminal.app
if_sudo_active defaults write com.apple.terminal StringEncodings -array 4

# Disable leading [ on prompt lines (which is totally broken in anything curses)
# https://twitter.com/UINT_MIN/status/652142001932996609
if_sudo_active defaults write com.apple.Terminal AutoMarkPromptLines -bool false
if_sudo_active defaults write com.apple.Terminal ShowLineMarks -bool false

# Hide scrollbars in terminal
if_sudo_active defaults write com.apple.Terminal AppleShowScrollBars -string "Automatic"

# Setup the correct theme
# if_sudo_active defaults write com.apple.Terminal "Default Window Settings" -string "parsec"
