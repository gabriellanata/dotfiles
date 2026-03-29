#!/usr/bin/env bash

alias reload="exec zsh"

alias install-dotfiles="$DOTFILES_DIR/install.sh"
alias dotfiles-install="install-dotfiles"
alias dotfiles-update="install-dotfiles"

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
alias cd..="cd .."
alias cd...="cd ../.."
alias cd....="cd ../../.."

# system
alias o="open"
alias oo="open ."

# xcode
alias xcode-select-default="sudo xcode-select -s /Applications/Xcode.app/Contents/Developer"
alias xsp="xcode-select -p"

# git
alias lg="lazygit"

# github
alias oprs="BROWSER=open open 'https://github.com/pulls'"

# python
alias venv-clean="lyftvenv venv -f"
alias venv="source venv/bin/activate"

# other
alias pre="pre-commit run --all-files"
alias pb="pbcopy"
alias desk="cd ~/Desktop"
alias ql="qlmanage -p "$@" >& /dev/null" # Quick look
alias e="micro" # Edit file
alias count="wc -l"
alias unique="uniq"
alias s="rg"
alias grep="rg"
alias ls="eza --hyperlink --icons=always --group-directories-first --level 2"

# Commands starting with % for pasting from web
alias %=" "
# alias $=" "

# Copilot
alias copilot="copilot --allow-all-tools --allow-all-paths"
alias 'cursor-cli'='cursor-agent'
alias '??'='copilot suggest -t shell'
alias 'gh?'='copilot suggest -t gh'
alias 'git?'='copilot suggest -t git'
alias 'explain'='copilot explain'
