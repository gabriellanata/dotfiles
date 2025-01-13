alias reload="exec zsh"

alias install-dotfiles="$DOTFILES_DIR/install.sh"
alias dotfiles-install="install-dotfiles"

alias zshrc="$EDITOR $DOTFILES_DIR/zshrc"
alias funcs="$EDITOR $DOTFILES_DIR/zsh/functions.zsh"
alias aliases="$EDITOR $DOTFILES_DIR/zsh/aliases.zsh"
alias apps="$EDITOR $DOTFILES_DIR/Brewfile"
alias brewfile="$EDITOR $DOTFILES_DIR/Brewfile"
alias preferences="$EDITOR $DOTFILES_DIR/preferences"
alias dotfiles="$EDITOR $DOTFILES_DIR"

# cd
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# system
alias o="open"
alias oo="open ."
alias ls="eza --hyperlink --icons=always --group-directories-first --level 2"
alias s="rg"

# xcode
alias xcode-select-default="sudo xcode-select -s /Applications/Xcode.app/Contents/Developer"
alias xsp="xcode-select -p"

# git
type hub &>/dev/null && eval "$(hub alias -s)" # Alias `git` as `hub`
alias lg="lazygit"

# github
alias oprs="BROWSER=open open 'https://github.com/pulls'"

# other
alias pre="pre-commit run --all-files"
alias pb="pbcopy"
alias desk="cd ~/Desktop"
alias ql="qlmanage -p "$@" >& /dev/null" # Quick look
alias e="micro" # Edit file

# Commands starting with % for pasting from web
alias %=" "
# alias $=" "

# 1password auth
export OP_PLUGIN_ALIASES_SOURCED=1
alias gh="op plugin run -- gh"
alias openai="op plugin run -- openai"
alias sentry-cli="op plugin run -- sentry-cli"

# Copilot
alias copilot="/opt/homebrew/bin/gh copilot"
alias '??'='copilot suggest -t shell'
alias 'gh?'='copilot suggest -t gh'
alias 'git?'='copilot suggest -t git'
alias 'explain'='gh copilot explain'

# locations
alias lyft="cd /Users/glanata/Developer/Lyft-iOS"
alias lyft1="cd /Users/glanata/Developer/Lyft-iOS"
alias lyft2="cd /Users/glanata/Developer/Lyft-iOS-2"
alias l1="cd /Users/glanata/Developer/Lyft-iOS"
alias l2="cd /Users/glanata/Developer/Lyft-iOS-2"
alias lpl="cd /Users/glanata/Developer/LyftProductLanguage"
alias hammer="cd /Users/glanata/Developer/Hammer"