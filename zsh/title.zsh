#!/usr/bin/env zsh

DISABLE_AUTO_TITLE="true"

function precmd () {
  local folder="$(print -rD $PWD | sed 's|.*/Developer/||')"
  echo -ne "\033]0;$folder\007"
}

function preexec () {
  local folder="$(print -rD $PWD | sed 's|.*/Developer/||')"
  print -Pn "\e]0;$folder\a"
}

precmd
