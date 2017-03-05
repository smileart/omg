#!/usr/bin/env bash
export module_color=1

# Color constants
export ansi_black='\033[30m'
export ansi_black_bold='\033[0;30;1m'
export ansi_red='\033[31m'
export ansi_red_bold='\033[0;31;1m'
export ansi_green='\033[32m'
export ansi_green_bold='\033[0;32;1m'
export ansi_yellow='\033[33m'
export ansi_yellow_bold='\033[0;33;1m'
export ansi_blue='\033[34m'
export ansi_blue_bold='\033[0;34;1m'
export ansi_magenta='\033[35m'
export ansi_magenta_bold='\033[0;35;1m'
export ansi_cyan='\033[36m'
export ansi_cyan_bold='\033[0;36;1m'
export ansi_white='\033[37m'
export ansi_white_bold='\033[0;37;1m'
export ansi_reset='\033[0m'

# Reset text attributes to normal without clearing screen.
alias Reset="tput sgr0"

# Color-echo.
# Argument $1 = color (defaults to white, if not specified)
# Other arguments will be passed directly to echo
function b.color.cecho {
  local opt=
  if [ "$1" == "-n" ]; then
    opt=$1
    shift
  fi

  local color=${1:-$ansi_white}
  shift

  echo -ne $color
  echo -n "$@"
  echo -e $opt "$ansi_reset"
}

function b.color.cecho_warning {
  b.color.cecho -n $ansi_yellow 'WARNING: '
}

function b.color.cecho_error {
  b.color.cecho -n $ansi_red 'ERROR: '
}
