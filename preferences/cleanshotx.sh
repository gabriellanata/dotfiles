#!/usr/bin/env bash

defaults write com.getcleanshot.app-setapp analyticsAllowed -bool NO
defaults write com.getcleanshot.app-setapp captureWithoutDesktopIcons -bool YES
defaults write com.getcleanshot.app-setapp lastLaunchVersion -string "4.7.5"
defaults write com.getcleanshot.app-setapp s008 -int 2
defaults write com.getcleanshot.app-setapp annotateDrawShadow -bool NO
defaults write com.getcleanshot.app-setapp autoClosePopup -bool NO
defaults write com.getcleanshot.app-setapp crosshairMode -int 2
defaults write com.getcleanshot.app-setapp cursorHighlightColor -int 8
defaults write com.getcleanshot.app-setapp cursorHighlightStyle -int 1
defaults write com.getcleanshot.app-setapp doNotDisturbWhileRecording -bool YES
defaults write com.getcleanshot.app-setapp downscaleRetinaScreenshots -bool YES
defaults write com.getcleanshot.app-setapp downscaleRetinaVideos -bool YES
defaults write com.getcleanshot.app-setapp exportPath -string "$HOME/Downloads"
defaults write com.getcleanshot.app-setapp freezeScreen -bool YES
defaults write com.getcleanshot.app-setapp highlightClicks -bool YES
defaults write com.getcleanshot.app-setapp historyCapacity -int 1
defaults write com.getcleanshot.app-setapp keyboardOverlayBlurBackground -bool YES
defaults write com.getcleanshot.app-setapp keyboardOverlayDisplayAll -bool YES
defaults write com.getcleanshot.app-setapp keyboardOverlaySize -int 36
defaults write com.getcleanshot.app-setapp keyboardOverlayStyle -int 1
defaults write com.getcleanshot.app-setapp rememberRecordingArea -bool YES
defaults write com.getcleanshot.app-setapp showKeystrokes -bool YES
defaults write com.getcleanshot.app-setapp showMenubarIcon -bool NO
defaults write com.getcleanshot.app-setapp transparentWindowBackground -bool YES
defaults write com.getcleanshot.app-setapp windowBackgroundPadding -int 1

# Disable system shortcuts

# Save picture of screen as file
defaults_write com.apple.symbolichotkeys AppleSymbolicHotKeys.28.enabled -bool NO
# Copy picture of screen to the clipboard
defaults_write com.apple.symbolichotkeys AppleSymbolicHotKeys.29.enabled -bool NO
# Save picture of selected area as file
defaults_write com.apple.symbolichotkeys AppleSymbolicHotKeys.30.enabled -bool NO
# Copy picture of selected area to the clipboar
defaults_write com.apple.symbolichotkeys AppleSymbolicHotKeys.31.enabled -bool NO
# Screenshot and recording options
defaults_write com.apple.symbolichotkeys AppleSymbolicHotKeys.184.enabled -bool NO