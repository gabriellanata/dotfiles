#!/usr/bin/env bash

set -euo pipefail

log "Linking steermouse configuration..."
link_file "$DOTFILES_DIR/configs/steermouse/Device.smsetting" "$HOME/Library/Application Support/SteerMouse & CursorSense/Device.smsetting"
