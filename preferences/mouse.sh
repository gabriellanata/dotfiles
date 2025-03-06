#!/usr/bin/env bash

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
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

# Increase size of mouse cursor
defaults write com.apple.AppleMultitouchMouse MouseDriverCursorSize -float 2.5

# Trackpad configuration
defaults write com.apple.trackpad FirstClickThreshold 0
defaults write com.apple.trackpad SecondClickThreshold 0
defaults write com.apple.trackpad showAppExposeGestureEnabled 1
defaults write com.apple.trackpad showLaunchpadGestureEnabled 1
defaults write com.apple.trackpad TrackpadTwoFingerFromRightEdgeSwipeGesture 3
defaults -currentHost write NSGlobalDomain com.apple.trackpad.scaling -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.forceClick -int 0
