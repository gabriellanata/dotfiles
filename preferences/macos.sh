#!/usr/bin/env bash


#
# General Settings
#

# Set computer name (as done via System Preferences → Sharing)
if_sudo_active scutil --set ComputerName "GaboMac"
if_sudo_active scutil --set HostName "GaboMac"
if_sudo_active scutil --set LocalHostName "GaboMac"

if [ -f "/Library/Preferences/SystemConfiguration/com.apple.smb.server" ]; then
  if_sudo_active defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "GaboMac"
fi

# Default sidebar icon size to small
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# Ask to keep changes on close
defaults write NSGlobalDomain NSCloseAlwaysConfirmsChanges -int 1

# Set system language
defaults write NSGlobalDomain AppleLanguage -array "en-US"

# Disables shutting down inactive applications
# defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Disable the "reopen windows when logging back in" option
# This works, although the checkbox will still appear to be checked.
defaults write com.apple.loginwindow TALLogoutSavesState -bool false
defaults write com.apple.loginwindow LoginwindowLaunchesRelaunchApps -bool false

# Always show scrollbars
# defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Disable Resume system-wide
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# Disable 'smart' quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Use tabs
defaults write NSGlobalDomain AppleWindowTabbingMode -string "always"

# https://mjtsai.com/blog/2020/10/05/big-surs-hidden-document-proxy-icon
defaults write NSGlobalDomain NSToolbarTitleViewRolloverDelay -float 0

# https://mmazzarolo.com/blog/2022-04-16-drag-window-by-clicking-anywhere-on-macos
defaults write NSGlobalDomain NSWindowShouldDragOnGesture -bool true

# Enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2


#
# Desktop, Screen Saver, Menu Bar and Mission Control
#

# Disable the screen saver (System Preferences must be closed)
# defaults -currentHost write com.apple.screensaver idleTime -int 0

# Ask for password for screensaver
defaults write com.apple.screensaver askForPassword -int 1

# Set delay before password ask (minutes x 60)
defaults write com.apple.screensaver askForPasswordDelay -int 5

# Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window
if_sudo_active defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Show shut down etc. buttons in Login Screen
if_sudo_active defaults write /Library/Preferences/com.apple.loginwindow PowerOffDisabled -bool false

# Show battery percentage
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Don't automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false


#
# Firewall
#

# Enable Firewall. Possible values:
# 0 = off
# 1 = on for specific services
# 2 = on for essential services
if_sudo_active defaults write /Library/Preferences/com.apple.alf globalstate -int 1


#
# Power Settings
#

# Half dimming before full display 'sleep'
if_sudo_active pmset -a halfdim 4

# Sleep options
if_sudo_active pmset -a displaysleep 5

# Wake for network access
if_sudo_active pmset -a womp 1

# Don't restart after power failure
if_sudo_active pmset -a autorestart 0

# Wake computer when laptop is opened
if_sudo_active pmset -a lidwake 1

# Don't wake computer when power source changes
if_sudo_active pmset -a acwake 0

# Don't dim brightness on any different source
if_sudo_active pmset -a lessbright 0

# Disable auto-adjust brightness
if_sudo_active defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor.plist "Automatic Display Enabled" -bool false

#
# Sound
#

# Enable the system alert sound
defaults write NSGlobalDomain com.apple.sound.beep.volume -int 1
defaults write NSGlobalDomain com.apple.sound.uiaudio.enabled -int 1

# Enable volume change feedback
defaults write NSGlobalDomain com.apple.sound.beep.feedback -bool true

#
# Date/Time
#

# 24 hour time
defaults write NSGlobalDomain AppleICUForce24HourTime -bool true
defaults write NSGlobalDomain AppleICUTimeFormatStrings -dict \
  1 -string "H:mm" \
  2 -string "H:mm:ss" \
  3 -string "H:mm:ss z" \
  4 -string "H:mm:ss zzzz"


### Stock Apps

# Mail: Only take address@example.com when copying email addresses in main
if_sudo_active defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Messages: Seems that Messages.app doesn't respect the system setting on Big Sur+ FB8920792
defaults write com.apple.messages.text SmartQuotes -bool false

# iCal: Day display and work hours
defaults write com.apple.iCal "number of hours displayed" -int 12
defaults write com.apple.iCal "n days of week" 7
defaults write com.apple.iCal "first minute of work hours" $((9 * 60))
defaults write com.apple.iCal "last minute of work hours" $((18 * 60))
defaults write com.apple.iCal lastViewsTimeZone "America/Los_Angeles"
defaults write com.apple.iCal "TimeZone support enabled" -bool true

# AddressBook: Sort users in Contacts by first name
if_sudo_active defaults write -app Contacts ABNameSortingFormat -string "sortingFirstName sortingLastName"


#
# Other Applications
#

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable new disks for time machine warning
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# Disk image changes
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
defaults write com.apple.DiskUtility DUDebugMenuEnabled 1
defaults write com.apple.DiskUtility advanced-image-options -bool true
defaults write com.apple.DiskUtility SidebarShowAllDevices -bool true

# Disable badges for Feedback Assistant, they never go away if you have a response that you reply to
defaults write com.apple.appleseed.FeedbackAssistant AttentionPrefBundleIDs -bool false


#
# Other Interface changes
#

# Set Help Viewer windows to non-floating mode
defaults write com.apple.helpviewer DevMode -bool true

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true


#
# Other subtle changes
#

# Save screenshots to the downloads folder
defaults write com.apple.screencapture location -string "$HOME/Downloads"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string png

# Show iOS like thumbnail
defaults write com.apple.screencapture show-thumbnail -bool true

# Disable opening random Apple photo applications when plugging in devices
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Enable automatic update & download
if_sudo_active defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
if_sudo_active defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Shows ethernet connected computers in airdrop
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0
# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4
# Open an empty file directly
defaults write com.apple.TextEdit NSShowAppCentricOpenPanelInsteadOfUntitledFile -bool false
# Force files to open in new windows instead of new tabs
# defaults write com.apple.TextEdit AppleWindowTabbingMode -string manual
# Set plain text font size
defaults write com.apple.TextEdit NSFixedPitchFontSize -int 16

# https://mjtsai.com/blog/2021/03/29/how-to-stop-mac-app-store-notifications
defaults write com.apple.appstored LastUpdateNotification -date "2029-12-12 12:00:00 +0000"

# Paste and match style by default
# defaults write -g NSUserKeyEquivalents "{ 'Paste and Match Style' = '@V'; }"
