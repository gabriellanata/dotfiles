#!/usr/bin/env bash

# defaults write -app Safari AlwaysRestoreSessionAtLaunch -bool true
if_sudo_active defaults write -app Safari AlwaysShowTabBar -bool true
if_sudo_active defaults write -app Safari AutoFillPasswords -bool false

# Prevent Safari from opening 'safe' files automatically after downloading,
# mostly because it trashes the original
if_sudo_active defaults write -app Safari AutoOpenSafeDownloads -bool false

# Change the Safari search to find strings contained in other words
if_sudo_active defaults write -app Safari FindOnPageMatchesWordStartsOnly -bool false

# Auto clear downloads
# if_sudo_active defaults write -app Safari DownloadsClearingPolicy -int 2

# Show developer tools
if_sudo_active defaults write -app Safari IncludeDevelopMenu -bool true

# Show full URL in Safari
# if_sudo_active defaults write -app Safari ShowFullURLInSmartSearchField -bool true

# Show status bar
# if_sudo_active defaults write -app Safari ShowOverlayStatusBar -bool true

# Never remove history, this is the constant the UI uses
# if_sudo_active defaults write -app Safari HistoryAgeInDaysLimit -int 365000
