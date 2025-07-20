#!/usr/bin/env bash

# Enables sudo to use Touch ID
# Copied instead of linked to ensure no permission issues
if_sudo_active cp "$DOTFILES_DIR/configs/sudo/sudo_local" "/etc/pam.d/sudo_local"
