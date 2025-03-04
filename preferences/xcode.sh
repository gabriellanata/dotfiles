#!/usr/bin/env bash

link_file "$DOTFILES_DIR/configs/xcode/keybindings" "$HOME/Library/Developer/Xcode/UserData/KeyBindings"
link_file "$DOTFILES_DIR/configs/xcode/themes" "$HOME/Library/Developer/Xcode/UserData/FontAndColorThemes"
link_file "$DOTFILES_DIR/configs/xcode/snippets" "$HOME/Library/Developer/Xcode/UserData/CodeSnippets"

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

# Make the tab key indent using leading whitespace
defaults write com.apple.dt.Xcode DVTTextTabKeyIndentBehavior -string InLeadingWhitespace

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
