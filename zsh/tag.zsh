#!/usr/bin/env bash

set -euo pipefail

if (( $+commands[tag] )); then
  tag() {
    trap 'source /tmp/tag_aliases 2>/dev/null' SIGINT
    command tag "$@" && source /tmp/tag_aliases 2>/dev/null
    trap - SIGINT
  }
  alias fd="tag fd"
  alias find="tag find"
  alias rg="tag rg"
fi