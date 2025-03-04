#!/usr/bin/env bash

link_file "$DOTFILES_DIR/configs/fork/custom-commands.json" "$HOME/Library/Application Support/com.DanPristupov.Fork/custom-commands.json"

defaults write com.DanPristupov.Fork "defaultSourceFolder" -string "/Users/glanata/Developer"
defaults write com.DanPristupov.Fork "mergeTool" -int 10 # Kaleidoscope
defaults write com.DanPristupov.Fork "mergeTool" -int 10 # Kaleidoscope
defaults write com.DanPristupov.Fork "terminalClient" -int 1 # iTerm
defaults write com.DanPristupov.Fork "applicationUpdateChannel" -int 2 # Beta
defaults write com.DanPristupov.Fork "enabledTabsOnFirstRun" -bool true

defaults write com.DanPristupov.Fork "useTopologicalCommitOrder" -bool true
defaults write com.DanPristupov.Fork "compactBranchLabels" -bool true
defaults write com.DanPristupov.Fork "fileListLayout" -string "tree"

defaults write com.DanPristupov.Fork "mergeType" -int 0
defaults write com.DanPristupov.Fork "fetchAllTags" -bool false
defaults write com.DanPristupov.Fork "fetchRemotesAutomatically" -bool false
defaults write com.DanPristupov.Fork "updateSubmodulesOnCheckout" -bool false

defaults write com.DanPristupov.Fork "deleteStashAfterApply" -bool true
defaults write com.DanPristupov.Fork "checkoutStashAndReapply" -bool true

defaults write com.DanPristupov.Fork "diffIgnoreWhitespaces" -bool false
defaults write com.DanPristupov.Fork "diffShowChangeMarks" -bool false
defaults write com.DanPristupov.Fork "diffShowEntireFile" -bool false
defaults write com.DanPristupov.Fork "diffShowHiddenSymbols" -bool false
defaults write com.DanPristupov.Fork "commitDiffLayoutMode" -int 0

defaults write com.DanPristupov.Fork "fetchSheetFetchAllRemotes" -bool false
defaults write com.DanPristupov.Fork "pullSheetRebase" -bool true
defaults write com.DanPristupov.Fork "pullSheetStashAndReapply" -bool true
defaults write com.DanPristupov.Fork "pushSheetPushAllTags" -bool false
defaults write com.DanPristupov.Fork "rebaseSheetAutostash" -bool true
defaults write com.DanPristupov.Fork "saveStashSheetStageNewFiles" -bool true
defaults write com.DanPristupov.Fork "trackBranchSheetStashAndReapply" -bool true
defaults write com.DanPristupov.Fork "checkoutBranchSheetStashAndReapply" -bool true
defaults write com.DanPristupov.Fork "cherryPickSheetAppendOriginSha" -bool false
