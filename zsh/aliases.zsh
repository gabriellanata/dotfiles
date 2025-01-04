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
alias ls="ls -F"

# xcode
alias xcode-select-default="sudo xcode-select -s /Applications/Xcode.app/Contents/Developer"
alias xsp="xcode-select -p"
alias x="xed ."

# git
alias gc-="git clean -f"
alias gri="git recent"
# alias rbmaster="gco master && ggpull && git checkout - && git rebase master"
# alias rbmain="gco main && ggpull && git checkout - && git rebase main"

# gh
alias cpr="BROWSER=open gh pr create --web"
alias orp="BROWSER=open gh repo view --web"
alias prs="BROWSER=open open 'https://github.com/pulls'"

# other
alias pre="pre-commit run --all-files"
alias pb="pbcopy"
alias desk="cd ~/Desktop"

# Commands starting with % for pasting from web
alias %=" "
# alias $=" "

# 1password auth
export OP_PLUGIN_ALIASES_SOURCED=1
alias gh="op plugin run -- gh"
alias openai="op plugin run -- openai"
alias sentry-cli="op plugin run -- sentry-cli"
