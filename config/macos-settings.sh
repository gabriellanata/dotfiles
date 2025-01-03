#!/usr/bin/env bash

# ~/.osx — http://mths.be/osx
# Watch for changes in files with either of
#  sudo fs_usage | grep plist
#  sudo opensnoop | grep plist
# Useful reference: http://www.hcs.harvard.edu/~jrus/Site/Cocoa%20Text%20System.html

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing 'sudo' time stamp until '.osx' has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


#
# General Settings
#

# Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName "GaboMac"
sudo scutil --set HostName "GaboMac"
sudo scutil --set LocalHostName "GaboMac"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "GaboMac"

# Default sidebar icon size to small
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# Ask to keep changes on close
defaults write NSGlobalDomain NSCloseAlwaysConfirmsChanges -int 1

# Disables shutting down inactive applications
# defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Disable the "reopen windows when logging back in" option
# This works, although the checkbox will still appear to be checked.
defaults write com.apple.loginwindow TALLogoutSavesState -bool false
defaults write com.apple.loginwindow LoginwindowLaunchesRelaunchApps -bool false
# Disable reopen on restart
defaults write NSGlobalDomain ApplePersistence -bool false

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
# Desktop & Screen Saver
#

# Disable the screen saver (System Preferences must be closed)
# defaults -currentHost write com.apple.screensaver idleTime -int 0

# Ask for password for screensaver
defaults write com.apple.screensaver askForPassword -int 1

# Set delay before password ask (minutes x 60)
defaults write com.apple.screensaver askForPasswordDelay -int 5

# Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Show shut down etc. buttons in Login Screen
sudo defaults write /Library/Preferences/com.apple.loginwindow PowerOffDisabled -bool false


#
# Dock
#

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36

# Disable dock magification
defaults write com.apple.dock magnification -bool true

# Put the dock on left side
defaults write com.apple.dock orientation -string "bottom"

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Change the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0.0
defaults write com.apple.dock autohide-time-modifier -float 0.0

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


#
# Menu Bar
#

# Show battery percentage
defaults write com.apple.menuextra.battery ShowPercent -string "YES"


#
# Mission Control
#

# Don't automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false


#
# Terminal
#

# Disable leading [ on prompt lines (which is totally broken in anything curses)
# https://twitter.com/UINT_MIN/status/652142001932996609
defaults write com.apple.Terminal AutoMarkPromptLines -bool false
defaults write com.apple.Terminal ShowLineMarks -bool false

# Hide scrollbars in terminal
defaults write com.apple.Terminal AppleShowScrollBars -string "Automatic"

# Setup the correct theme
# defaults write com.apple.Terminal "Default Window Settings" -string "parsec"
# defaults write com.apple.Terminal "Startup Window Settings" -string "parsec"


#
# Firewall
#

# Enable Firewall. Possible values:
# 0 = off
# 1 = on for specific services
# 2 = on for essential services
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1

# Disable auto-adjust brightness
sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor.plist "Automatic Display Enabled" -bool false


#
# Power Settings
#

# To stop the display from half dimming before full display 'sleep'
# http://developer.apple.com/library/mac/#documentation/Darwin/Reference/ManPages/man1/pmset.1.html
# sudo pmset -a halfdim 0

# Sleep options
sudo pmset -a displaysleep 5

# Wake for network access
sudo pmset -a womp 1

# Don't restart after power failure
sudo pmset -a autorestart 0

# Wake computer when laptop is opened
sudo pmset -a lidwake 1

# Don't wake computer when power source changes
sudo pmset -a acwake 0

# Don't dim brightness on any different source
sudo pmset -a lessbright 0


#
# Keyboard
#

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


#
# Mouse/Trackpad
#

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Trackpad: disable three finger tap
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerTapGesture -int 0
defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerTapGesture -int 0

# Trackpad: enable two finger pinch
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadPinch -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.pinchGesture -int 1

# Trackpad: enable 'smart zoom' two finger double tap
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerDoubleTapGesture -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.twoFingerDoubleTapGesture -int 1

# Trackpad: enable trackpad rotate
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRotate -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.rotateGesture -int 1

# Trackpad: enable swipe from right to show notification center
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.twoFingerFromRightEdgeSwipeGesture -int 1

# Enable El Capitan shake to magnify cursor
defaults write NSGlobalDomain CGDisableCursorLocationMagnification -bool false

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

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


#
# Finder
#

# Allow quitting via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

# Hide hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool false

# Hide all icons on desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# Finder: hide all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool false

# Show Status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Show Path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# Use column view in all Finder windows by default
# Four-letter codes for the other view modes: 'icnv', 'clmv', 'Flwv', 'Nlsv'
defaults write com.apple.finder FXPreferredViewStyle -string clmv

# Allow text selection in QuickLook
defaults write com.apple.finder QLEnableTextSelection -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string SCcf

# Finder: new window location set to $HOME. Same as Finder > Preferences > New Finder Windows show
# For other path use "PfLo" and "file:///foo/bar/"
defaults write com.apple.finder NewWindowTarget -string PfLo
defaults write com.apple.finder NewWindowTargetPath -string "file://$HOME/"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Empty Trash securely by default
# defaults write com.apple.finder EmptyTrashSecurely -bool true

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

# Should remove downloaded from the internet warnings
# defaults write com.apple.LaunchServices LSQuarantine -bool false

# Enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Don't use tabs in Finder
defaults write com.apple.finder AppleWindowTabbingMode -string "manual"

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Show item info near icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

# Increase grid spacing for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 64" ~/Library/Preferences/com.apple.finder.plist

# Increase the size of icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 64" ~/Library/Preferences/com.apple.finder.plist

# Set the finder window toolbar to only have back/forward buttons
# /usr/libexec/PlistBuddy -c "Delete :NSToolbar\\ Configuration\\ Browser:TB\\ Item\\ Identifiers" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Add :NSToolbar\\ Configuration\\ Browser:TB\\ Item\\ Identifiers array" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Add :NSToolbar\\ Configuration\\ Browser:TB\\ Item\\ Identifiers:0 string com.apple.finder.BACK" ~/Library/Preferences/com.apple.finder.plist

# Remove all tags from contextual menu
/usr/libexec/PlistBuddy -c "Delete :FavoriteTagNames" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Add :FavoriteTagNames array" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Add :FavoriteTagNames:0 string" ~/Library/Preferences/com.apple.finder.plist


#
# Safari/WebKit
#

defaults write -app Safari AlwaysRestoreSessionAtLaunch -bool true
defaults write -app Safari AlwaysShowTabBar -bool true
defaults write -app Safari AutoFillPasswords -bool false

# Prevent Safari from opening 'safe' files automatically after downloading,
# mostly because it trashes the original
defaults write -app Safari AutoOpenSafeDownloads -bool false

# Change the Safari search to find strings contained in other words
defaults write -app Safari FindOnPageMatchesWordStartsOnly -bool false

# Auto clear downloads
defaults write -app Safari DownloadsClearingPolicy -int 2

# Show developer tools
defaults write -app Safari IncludeDevelopMenu -bool true

# Show full URL in Safari
defaults write -app Safari ShowFullURLInSmartSearchField -bool true

# Show status bar
defaults write -app Safari ShowOverlayStatusBar -bool true

# Never remove history, this is the constant the UI uses
defaults write -app Safari HistoryAgeInDaysLimit -int 365000

#
# Mail
#

# Only take address@example.com when copying email addresses in main
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false


#
# Messages
#


# Seems that Messages.app doesn't respect the system setting on Big Sur+ FB8920792
defaults write com.apple.messages.text SmartQuotes -bool false

# Hide scrollbars in Messages.app
# defaults write com.apple.iChat AppleShowScrollBars -string Automatic


#
# iCal
#

# Show 7 days and 12 hours
defaults write com.apple.iCal "number of hours displayed" -int 12
defaults write com.apple.iCal "n days of week" 7

# Day start and end
defaults write com.apple.iCal "first minute of work hours" $((9 * 60))
defaults write com.apple.iCal "last minute of work hours" $((18 * 60))

# Timezone settings
defaults write com.apple.iCal lastViewsTimeZone "America/Los_Angeles"
defaults write com.apple.iCal "TimeZone support enabled" -bool true


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
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -bool true

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

# Sort users in Contacts by first name
defaults write -app Contacts ABNameSortingFormat -string "sortingFirstName sortingLastName"


#
# Xcode
#

# Trim trailing whitespace
defaults write com.apple.dt.Xcode DVTTextEditorTrimTrailingWhitespace -bool true

# Trim whitespace only lines
defaults write com.apple.dt.Xcode DVTTextEditorTrimWhitespaceOnlyLines -bool true

# Show completion on escape
defaults write com.apple.dt.Xcode DVTTextShowCompletionsOnEsc -bool true

# Show line numbers
defaults write com.apple.dt.Xcode DVTTextShowLineNumbers -bool true

# Show the code folding ribbon
defaults write com.apple.dt.Xcode DVTTextShowFoldingSidebar -bool true

# Enable automatic updates
defaults write com.apple.dt.Xcode DVTDownloadableAutomaticUpdate -bool true

# Live issues
defaults write com.apple.dt.Xcode IDEEnableLiveIssues -bool true

# Setup page guide
defaults write com.apple.dt.Xcode DVTTextShowPageGuide -bool true
defaults write com.apple.dt.Xcode DVTTextPageGuideLocation -int 110

# Max number of lines
defaults write com.apple.dt.Xcode IDEIssueNavigatorDetailLevel -int 10
defaults write com.apple.dt.Xcode IDESearchNavigatorDetailLevel -int 10

# Enable internal debug menu
defaults write com.apple.dt.Xcode ShowDVTDebugMenu -bool true

# Source control local revision side
defaults write com.apple.dt.Xcode DVTComparisonOrientationDefaultsKey -int 0

# Stack assitant editors vertically
defaults write com.apple.dt.Xcode AssistantEditorsLayout -int 1

# Use open quickly to open in the focused pane
defaults write com.apple.dt.Xcode IDEEditorCoordinatorTarget_Click -string FocusedEditor

# Use custom derived data location
# defaults write com.apple.dt.Xcode IDECustomDerivedDataLocation -string DerivedData

# Show build times in toolbar
# http://cocoa.tumblr.com/post/131023038113/build-speed
defaults write com.apple.dt.Xcode ShowBuildOperationDuration -bool true

# Add more information to Xcode's build output about why specific commands are being run
# https://twitter.com/bdash/status/661742266487205888
# http://www.openradar.me/27516128
defaults write com.apple.dt.Xcode ExplainWhyBuildCommandsAreRun -bool true

# Stop Xcode from reopening files (specifically storyboards) on launch.
# I also have a `xcuser` shell command to wipe this state so you don't reopen
# storyboards and dirty the diff, or just take 30 seconds to launch
defaults write com.apple.dt.Xcode IDEDisableStateRestoration -bool true

# Write detailed build system info into derived data
# If you don't enable this but `mkdir /tmp/xcode_dependency_logs` the logs will
# be created there instead
defaults write com.apple.dt.Xcode EnableBuildSystemLogging -bool true

# Disable the print keyboard shortcut in Xcode. I accidentally hit this a lot
defaults write com.apple.dt.Xcode NSUserKeyEquivalents -dict-add "Print..." "nil"

# Enable extra logging for XCBuild
defaults write com.apple.dt.XCBuild EnableBuildDebugging -bool true
defaults write com.apple.dt.XCBuild EnableDebugActivityLogs -bool true

# Make the tab key actually be a tab key
defaults write com.apple.dt.Xcode DVTTextTabKeyIndentBehavior -string Never

# Set the keybindings to my customizations (see $DOTFILES/xcode)
# Stored in ~/Library/Developer/Xcode/UserData/KeyBindings
defaults write com.apple.dt.Xcode IDEKeyBindingCurrentPreferenceSet -string "Gabriel.idekeybindings"

# Set custom colorscheme
defaults write com.apple.dt.Xcode XCFontAndColorCurrentTheme -string "Gabriel_Dark.xccolortheme"
defaults write com.apple.dt.Xcode XCFontAndColorCurrentDarkTheme -string "Gabriel_Dark.xccolortheme"

# Show indexing progress
# https://twitter.com/dmartincy/status/1034930612543676418
defaults write com.apple.dt.Xcode IDEIndexerActivityShowNumericProgress -bool true

# Make command click jump to definition instead of showing the menu
defaults write com.apple.dt.Xcode IDECommandClickNavigates -bool true

# https://gist.github.com/tkersey/6b6c1d91415c785a10560ae564288a65
defaults write com.apple.dt.Xcode ShowDVTDebugMenu -bool true

# Hide the minimap
defaults write com.apple.dt.Xcode DVTTextShowMinimap -bool false

# Continue building after errors
defaults write com.apple.dt.Xcode IDEBuildingContinueBuildingAfterErrors -bool true

# Disable Source Control
# defaults write com.apple.dt.Xcode IDESourceControlEnableSourceControl_10_0 -bool false

# Show all file extensions
# defaults write com.apple.dt.Xcode IDEFileExtensionDisplayMode -int 1

# https://twitter.com/iKenndac/status/1587867958348599308
defaults write com.apple.dt.Xcode XcodeCloudUpsellPromptEnabled -bool false



# =============================================================================#
# Kill affected applications                                                   #
# =============================================================================#

echo "Almost complete, no we need to shutdown affected applications.. "
read -p "press any key." -n 1

for app in "Address Book" "Calendar" "Contacts" "Dashboard" "Dock" "Finder" \
	"Mail" "Safari" "SystemUIServer" "Terminal" "iCal" "iTunes" "Activity Monitor"; do
	killall "$app" > /dev/null 2>&1
done

echo "Done. Note that some of these changes require a logout/restart to take effect."
# vim:tw=0