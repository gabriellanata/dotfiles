# zsh configuration
export ZSH="$HOME/.oh-my-zsh"

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

# Load oh-my-zsh defaults
source $ZSH/oh-my-zsh.sh

# Prevent bypassing pushRemote config by explicitly adding the remote
unalias ggpush
unsetopt correct_all

# Jump to start/end of line (needs override)
bindkey "^E" end-of-line
bindkey "^B" beginning-of-line

# Load fzf
source <(fzf --zsh)
