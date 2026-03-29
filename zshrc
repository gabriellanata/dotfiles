export DOTFILES_DIR="$(dirname "$(readlink "$HOME/.zshrc")")"
source "$DOTFILES_DIR/env.sh"

# path (the last one is the highest priority)
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export PATH="$HOME/.rd/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# system
export LC_ALL=en_US.UTF-8
export EDITOR="$BREW_PREFIX/bin/cursor"
export BROWSER="/Applications/Google\ Chrome.app/Contents/MacOs/Google\ Chrome"

# pip fallback
export PIP_EXTRA_INDEX_URL=https://pypi.org/simple

# shell
ZSH_THEME="robbyrussell"
DISABLE_UPDATE_PROMPT="true"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# plugins (must be set before sourcing oh-my-zsh)
plugins=(
  git
  dotenv
  macos
  zsh-syntax-highlighting
  zsh-autosuggestions
  colored-man-pages
  fzf
)

# zsh configuration
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh # Must be ran before other config files

# git
export GIT_PILE_PREFIX="gabriel/"

# Source all zsh files
configs=($DOTFILES_DIR/zsh/*.zsh)
for file in ${configs}; do
  source "$file"
done
