#!/usr/bin/env bash

# defaults write -app Safari AlwaysRestoreSessionAtLaunch -bool true
defaults write -app Safari AlwaysShowTabBar -bool true
defaults write -app Safari AutoFillPasswords -bool false

# Prevent Safari from opening 'safe' files automatically after downloading,
# mostly because it trashes the original
defaults write -app Safari AutoOpenSafeDownloads -bool false

# Change the Safari search to find strings contained in other words
defaults write -app Safari FindOnPageMatchesWordStartsOnly -bool false

# Auto clear downloads
# defaults write -app Safari DownloadsClearingPolicy -int 2

# Show developer tools
defaults write -app Safari IncludeDevelopMenu -bool true

# Show full URL in Safari
# defaults write -app Safari ShowFullURLInSmartSearchField -bool true

# Show status bar
# defaults write -app Safari ShowOverlayStatusBar -bool true

# Never remove history, this is the constant the UI uses
# defaults write -app Safari HistoryAgeInDaysLimit -int 365000
