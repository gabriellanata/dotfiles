#!/usr/bin/env bash

# Lyft
alias l="lyft"
alias la="lyft list-modules | fzf | lyft generate"
alias cdl="cd /Users/glanata/Developer/Lyft-iOS"
alias cdl1="cd /Users/glanata/Developer/Lyft-iOS"
alias cdl2="cd /Users/glanata/Developer/Lyft-iOS-2"
alias cdlyft="cd /Users/glanata/Developer/Lyft-iOS"
alias cdlyft1="cd /Users/glanata/Developer/Lyft-iOS"
alias cdlyft2="cd /Users/glanata/Developer/Lyft-iOS-2"
alias cdlpl="cd /Users/glanata/Developer/LyftProductLanguage"
alias cdandroid="cd /Users/glanata/Developer/instant-android"
alias cdhammer="cd /Users/glanata/Developer/Hammer"
alias cdmobile="cd /Users/glanata/Developer/mobilescoringint"
alias cdm="cd /Users/glanata/Developer/mobilescoringint"
alias cddocs="cd /Users/glanata/Developer/docs"
alias cddotfiles="cd /Users/glanata/Developer/dotfiles"
alias cddev="cd /Users/glanata/Developer"
alias cdlanata="cd /Users/glanata/Developer/Lanata-Server"

# Gearbox
gearboxdb() {
  local env="${1:-production}"
  local output="$(source venv/bin/activate && make db-connect ENV="$env" PASS=1 2>&1)"
  local url=$(echo "$output" | grep "^URL:" | cut -d" " -f2-)
  open -a TablePlus "$url"
}
alias gearboxdb-prod='gearboxdb production'
alias gearboxdb-staging='gearboxdb staging'
alias gearboxdb-local='open -a TablePlus "postgresql://postgres@127.0.0.1:5432/gearboxapi"'
