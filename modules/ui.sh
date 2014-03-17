module_color="ui"
b.framework.require 'color'

function b.ui.ask_yes_or_not() {

  read -p "$1? (yN)" -n 1 -r
  echo    # (optional) move to a new line
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    return 1
  fi
}

function b.ui.wait_sec_for_return() {
    read -t $1 -p "$2 $1 seconds (⏎ )"
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