#!/usr/bin/env zsh

DISABLE_AUTO_TITLE="true"

function precmd () {
  local folder="${PWD/#$SRC_DIR\//}"
  echo -ne "\033]0;$folder\007"
}

function preexec () {
  local folder="${PWD/#$SRC_DIR\//}"
  print -Pn "\e]0;$folder\a"
}

precmd
