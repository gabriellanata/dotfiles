#!/usr/bin/env bash

# Lyft
alias l="lyft"
alias la="lyft list-modules | fzf | lyft generate"
alias cdl="cd $SRC_DIR/Lyft-iOS"
alias cdl1="cd $SRC_DIR/Lyft-iOS"
alias cdl2="cd $SRC_DIR/Lyft-iOS-2"
alias cdlyft="cd $SRC_DIR/Lyft-iOS"
alias cdlyft1="cd $SRC_DIR/Lyft-iOS"
alias cdlyft2="cd $SRC_DIR/Lyft-iOS-2"
alias cdlpl="cd $SRC_DIR/LyftProductLanguage"
alias cdios="cd $SRC_DIR/Lyft-iOS"
alias cdandroid="cd $SRC_DIR/instant-android"
alias cdhammer="cd $SRC_DIR/Hammer"
alias cdmobile="cd $SRC_DIR/mobilescoringint"
alias cdgearbox="cd $SRC_DIR/gearboxapi"
alias cdm="cd $SRC_DIR/mobilescoringint"
alias cdmobile="cd $SRC_DIR/mobilescoringint"
alias cdmobiledocs="cd $SRC_DIR/mobile-docs"
alias cddocs="cd $SRC_DIR/docs"
alias cddotfiles="cd $SRC_DIR/dotfiles"
alias cdsrc="cd $SRC_DIR"
alias cddev="cd $SRC_DIR"
alias cdlanata="cd $SRC_DIR/Lanata-Server"

# Gearbox
gearboxdb() {
  local env="${1:-production}"
  local output url styling ec

  output="$(source venv/bin/activate && make db-connect ENV="$env" PRINT=1 2>&1)"
  ec=$?
  if (( ec != 0 )); then
    echo "gearboxdb: db-connect failed (exit ${ec})" >&2
    echo "$output" >&2
    return "$ec"
  fi

  url=$(echo "$output" | grep "^URL:" | cut -d" " -f2-)
  if [[ -z "$url" ]]; then
    echo "gearboxdb: db-connect produced no URL line" >&2
    echo "$output" >&2
    return 1
  fi

  case "$env" in
  production)
    styling='statusColor=C50000&env=production'
    ;;
  staging)
    styling='statusColor=CA8A04&env=staging'
    ;;
  *)
    styling='statusColor=007F3D&env=local'
    ;;
  esac

  echo "$url"
  [[ "$url" == *\?* ]] && url="${url}&${styling}" || url="${url}?${styling}"
  open -a TablePlus "$url" || return $?
}
alias gearboxdb-prod='gearboxdb production'
alias gearboxdb-staging='gearboxdb staging'
alias gearboxdb-local='gearboxdb local'
