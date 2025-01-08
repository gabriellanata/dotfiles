#!/usr/bin/env bash

set -euo pipefail

# Update wallpaper
wallpaper="$DOTFILES_DIR/configs/desktop/MountainBackground.png"
osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"$wallpaper\""