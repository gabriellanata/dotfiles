#!/usr/bin/env bash

set -euo pipefail


alias l="lyft-generate"
alias la="lyft-modules | fzf | l"

function lyft-generate() {
  if [[ ! "$PWD" =~ "Lyft-iOS" ]]; then
      echo "Error: Must be in Lyft-iOS directory"
      return 1
  fi

  ./ios generate --include-previous --include-changed
}

function lyft-modules() {
  if [[ ! "$PWD" =~ "Lyft-iOS" ]]; then
      echo "Error: Must be in Lyft-iOS directory"
      return 1
  fi

  ls ./Modules \
  | sed -E 's/(Flow|UI|Plugins|PluginConfiguration|Service|-UITests)$/*/' \
  | sort -u \
  | awk '
    {
      full = $0
      base = full
      sub(/\*$/, "", base)
      if (/\*$/) { haveAsterisk[base] = 1 }
      if (!(base in firstLine)) { firstLine[base] = full }
    }
    END {
      for (b in firstLine) {
        if (haveAsterisk[b]) {
          print b "*"
        } else {
          print b
        }
      }
    }
  ' \
  | sort
}