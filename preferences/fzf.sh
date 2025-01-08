#!/usr/bin/env bash

set -euo pipefail

export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_DEFAULT_OPTS="--preview 'bat --color=always {}'"
