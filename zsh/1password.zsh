#!/usr/bin/env bash

# 1password auth
export OP_BIOMETRIC_UNLOCK_ENABLED=true
export OP_PLUGIN_ALIASES_SOURCED=1
alias gh="op plugin run -- gh"
alias openai="op plugin run -- openai"
alias sentry-cli="op plugin run -- sentry-cli"
alias todoist="op plugin run -- todoist"
alias aws="op plugin run -- aws"
