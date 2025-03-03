#!/usr/bin/env bash

set -euo pipefail

link_file "$DOTFILES_DIR/configs/ssh/config" "$HOME/.ssh/config"

# Create the controlmasters directory if it doesn't exist
mkdir -p ~/.ssh/controlmasters

# Set the correct permissions for the controlmasters directory
chmod 700 ~/.ssh/controlmasters
