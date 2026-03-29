#!/usr/bin/env bash

export DOTFILES_DIR="${DOTFILES_DIR:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
export SRC_DIR="$HOME/src"

if [[ $(arch) == arm64* ]]; then
    export BREW_PREFIX=/opt/homebrew
else
    export BREW_PREFIX=/usr/local
fi
