alias reload="exec zsh"

alias zshrc="$EDITOR ~/dotfiles/zshrc"
alias funcs="$EDITOR ~/dotfiles/functions.zsh"
alias aliases="$EDITOR ~/dotfiles/aliases.zsh"

# system
alias o="open"
alias oo="open ."

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

alias pre="pre-commit run --all-files"
alias pb="pbcopy"
alias desk="cd ~/Desktop"
