#!/usr/bin/env bash

# Define dock apps
dockApps=( \
    "Google Chrome" \
    "SetApp/Spark Mail" \
    "Spark" \
    "Messages" \
    "Slack" \
    "Calendar" \
    "Todoist" \
    "" \
    "Xcode" \
    "Xcode.app/Contents/Developer/Applications/Simulator"
    "Cursor" \
    "Ghostty" \
    "" \
)

# Define dock apps
dockFolders=( \
    "$HOME/Downloads" \
)

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

### Update Dock

log "Updating Dock..."

# Clear items
dockutil --remove all --no-restart

# Add apps
for app in "${dockApps[@]}"; do
    if [ -d "/System/Applications/$app.app" ]; then
        dockutil --add "/System/Applications/$app.app" --no-restart
    elif [ -d "/Applications/$app.app" ]; then
        dockutil --add "/Applications/$app.app" --no-restart
    elif [[ "$app" == /* ]]; then
        dockutil --add "$app" --no-restart
    elif [ -z "$app" ]; then
        dockutil --add "" --type spacer --section apps --no-restart
    else
        echo "Unable to find the specified app: $app"
    fi
done

# Add folders
for folder in "${dockFolders[@]}"; do
    if [ -d "$folder" ]; then
        dockutil --add "$folder" --view fan --display folder --sort dateadded --no-restart
    else
        echo "Unable to find the specified folder: $folder"
    fi
done
