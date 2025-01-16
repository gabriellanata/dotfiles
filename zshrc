export DOTFILES_DIR="$(dirname "$(readlink "$HOME/.zshrc")")"
if [[ $(arch) == arm64* ]]; then
  export BREW_PREFIX=/opt/homebrew
else
  export BREW_PREFIX=/usr/local
fi

# system
export PATH=$HOME/bin:$PATH
export LC_ALL=en_US.UTF-8
export EDITOR="$(which code)"
export BROWSER="/Applications/Google\ Chrome.app/Contents/MacOs/Google\ Chrome"

# shell
ZSH_THEME="robbyrussell"
DISABLE_UPDATE_PROMPT="true"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# zsh configuration
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh # Must be ran before other config files

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

# Load fzf
source <(fzf --zsh)

# Source all zsh files
configs=($DOTFILES_DIR/zsh/*.zsh)
for file in ${configs}; do
  source "$file"
done

### lyft_localdevtools_shell_rc start
### DO NOT REMOVE: automatically installed as part of Lyft local dev tool setup
if [[ -f "/opt/homebrew/Library/Taps/lyft/homebrew-localdevtools/scripts/shell_rc.sh" ]]; then
    source "/opt/homebrew/Library/Taps/lyft/homebrew-localdevtools/scripts/shell_rc.sh"
fi
### lyft_localdevtools_shell_rc end

### DO NOT REMOVE: automatically installed as part of Lyft local dev tool setup
eval "$(fnm env --use-on-cd --version-file-strategy=recursive)"
