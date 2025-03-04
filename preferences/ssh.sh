#!/usr/bin/env bash

# Create the controlmasters directory if it doesn't exist
if_sudo_active mkdir -p ~/.ssh/controlmasters

# Set the correct permissions for the controlmasters directory
if_sudo_active chmod 700 ~/.ssh/controlmasters

# Link configuration
if_sudo_active link_file "$DOTFILES_DIR/configs/ssh/config" "$HOME/.ssh/config"

# Set up the SHH key from 1 password
if_sudo_active op read --out-file ~/.ssh/id_ed25519 "op://Private/SSH Key/private key?ssh-format=openssh"