export DOTFILES="$(dirname "$(readlink "$HOME/.zshrc")")"
if [[ $(arch) == arm64* ]]; then
  export BREW_PREFIX=/opt/homebrew
else
  export BREW_PREFIX=/usr/local
fi

# system
export PATH=$HOME/bin:$PATH
export LC_ALL=en_US.UTF-8
export EDITOR="$(which nano)"
export BROWSER="Chrome"

# shell
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
DISABLE_UPDATE_PROMPT="true"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# git
export GIT_PILE_PREFIX="gabriel/"

# plugins
plugins=(
  git
  dotenv
  macos
  zsh-syntax-highlighting
  zsh-autosuggestions
  colored-man-pages
)

# Source all zsh files
configs=($DOTFILES/zsh/*.zsh)
for file in ${configs}; do
  source "$file"
done
