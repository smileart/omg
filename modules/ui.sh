shopt -s extglob
module_ui=1
b.framework.require 'color'

function b.ui.ask_yes_or_not() {
  default=n
  echo
  read -p "$1? (yN)" -n 1 -r
  REPLY="${REPLY:-$default}"

  while (true)
  do
    if [[ ! $REPLY == @(Y|y|N|n|yes|no) ]]; then
      echo
      read -p "$1? (yN)" -n 1 -r
      [ -n "$REPLY" ] && name=$REPLY
      echo
      echo "Please answer with YES or NO with Y/y/N/n/yes/no"
    else
      echo # test
      if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        return 1
      else
        return 0
      fi
    fi
  done
}

function b.ui.ask_for_input() {
  read -p "$1: " input
  echo $input
}

function b.ui.wait_sec_for_return() {
    read -t $1 -p "$2 $1 seconds (⏎)"
}

function b.ui.padding() {
    str=$1
    num=$2
    v=$(printf "%-${num}s" "$str")
    printf "${v// /$1}"
}

function b.ui.dude() {
    b.color.cecho $ansi_yellow "   ʕ|⊙_ʖ⊙|ʔ <( $1 )"
}

function b.ui.smiley_dude() {
    b.color.cecho $ansi_green "   ʕ|⊙ ͜ʖ⊙|ʔ <( $1 )"
}

function b.ui.sleepy_dude() {
    b.color.cecho $ansi_white "   ʕ| ◡_ʖ◡|ʔ <( $1 )"
}

function b.ui.sad_dude() {
    b.color.cecho $ansi_red "   ʕ|⊚⏜ʖ⊚|ʔ <( $1 )"
}


function b.ui.albert() {
    b.ui.padding " " $[ ${#1} + 1 ]
    b.color.cecho $ansi_blue "        ┌─┐ "
    b.ui.padding " " $[ ${#1} + 1 ]
    b.color.cecho $ansi_blue "        ┴─┴ "
    b.color.cecho $ansi_blue "   ( $1 )> ಠ_ರೃ"
}
