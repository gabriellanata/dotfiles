#!/usr/bin/env bash

set -euo pipefail

# Set the icon size of Dock items
defaults write com.apple.dock tilesize -int 46
defaults write com.apple.dock largesize -int 100

# Disable dock magification
defaults write com.apple.dock magnification -bool true

# Put the dock on left side
defaults write com.apple.dock orientation -string "bottom"

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Change the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0.0
defaults write com.apple.dock autohide-time-modifier -float 0.4

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Dock tweaks
defaults write com.apple.dock mouse-over-hilte-stack -bool true

# Don't show recents
defaults write com.apple.dock show-recents -bool false

# Disable the Launchpad gesture (pinch with thumb and three fingers)
defaults write com.apple.dock showLaunchpadGestureEnabled -int 0

# Clear items
dockutil --remove all

# Add apps
dockutil --add "/Applications/Google Chrome.app" --no-restart
dockutil --add "/Applications/Slack.app" --no-restart
dockutil --add "/Applications/Spark.app" --no-restart