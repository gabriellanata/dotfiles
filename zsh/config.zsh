#!/usr/bin/env bash

set -euo pipefail

# History settings
# Save x items to the given history file
export HISTSIZE=100000000
export SAVEHIST=100000000
# export HISTFILE=$HOME/.marcos_zsh_history

# No autocorrect
unsetopt correct_all

# Append history to the zsh_history file
setopt APPEND_HISTORY

# Write to history after each command
setopt INC_APPEND_HISTORY

# Write the running time of commands to the history
# NOTE: the zsh documentation says this and INC_APPEND_HISTORY are mutually
# exclusive, but this seems to work fine.
setopt INC_APPEND_HISTORY_TIME

# Ignore duplicates in zsh history
setopt HIST_IGNORE_ALL_DUPS

# Ignore commands for history that start with a space
setopt HIST_IGNORE_SPACE

# Remove superfluous blanks from each line being added to the history list
setopt HIST_REDUCE_BLANKS

# After !! previous command don't execute, allow editing
setopt HIST_VERIFY

# Auto-cd when issuing a command that is a directory name
setopt auto_cd

# Case-insensitive globbing. This allows case-insensitive expansions
# e.g. % ls ~/d*<tab> expands to % ls /Users/dte/Desktop /Users/dte/Documents
setopt no_case_glob

# Enable autocorrection on commands
setopt correct
setopt correct_all

# pushd for cd commands
setopt AUTO_PUSHD
setopt CDABLE_VARS
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_MINUS
setopt PUSHD_SILENT
setopt PUSHD_TO_HOME
DIRSTACKSIZE=16

# Jump to end after completion
setopt ALWAYS_TO_END

# Show menu after multiple tabs
setopt AUTO_MENU

# No beep
unsetopt BEEP
unsetopt HIST_BEEP
unsetopt LIST_BEEP

# Warn before quitting with background jobs
setopt CHECK_JOBS

# Allow alt/option . to insert the argument from the previous command
bindkey '\e.' insert-last-word

# Jump to start/end of line (needs override)
bindkey "^E" end-of-line
bindkey "^B" beginning-of-line

# Auto-completion
autoload -Uz compinit && compinit

# Load fzf
source <(fzf --zsh)