#!/usr/bin/env bash
cwd=$(pwd)
source "$cwd/modules/framework.sh"

b.framework.require 'color'
b.framework.require 'ui'
b.framework.require 'system'

echo
echo "         “Begin at the beginning,” the King said, very gravely,"
echo "               “and go on till you come to the end: then stop.”"
echo
echo "                                    © Charles Lutwidge Dodgson"
echo

# Good to know: http://en.wikipedia.org/wiki/Here_document
cat << 'HERE'
       _____           _ _                  _______ _
      / ____|         (_) |         ____   |__   __( )
     | (___  _ __ ___  _| | ___    / __ \ _ __| |  |/ ___
      \___ \| '_ ` _ \| | |/ _ \  / / _` | '__| |    / __|
      ____) | | | | | | | |  __/ | | (_| | |  | |    \__ \
   __|_____/|_| |_|_|_|_|_|\___|  \ \__,_|_|  |_|   _|___/
  / __ \|  \/  |/ ____| | |_   _|  \____/ | |      | | |
 | |  | | \  / | |  __| |   | |  _ __  ___| |_ __ _| | | ___ _ __
 | |  | | |\/| | | |_ | |   | | | '_ \/ __| __/ _` | | |/ _ \ '__|
 | |__| | |  | | |__| |_|  _| |_| | | \__ \ || (_| | | |  __/ |
  \____/|_|  |_|\_____(_) |_____|_| |_|___/\__\__,_|_|_|\___|_|
    * One More Gear v.0.0.1
HERE

echo
echo

b.ui.wait_sec_for_return 20 "        Press enter to continue or wait for"
clear

echo
echo
b.ui.smiley_dude "Hey there! I'm Dude and I'm going to help you during installation process!"
echo
b.ui.albert "Your Grace, I'm Albert and I'm going to inform you if needed."

echo
echo
b.ui.wait_sec_for_return 15 "    Press enter to begin installation or wait for"
clear

if b.system.command_exists 'uname' &&
  b.system.command_exists 'tar'; then
  b.color.cecho $ansi_green '✔ All pre-pre requirements are installed!'
else
  b.ui.albert 'Some required packages are absent!'
  exit 1
fi

bash_version=$(b.system.get_bash_major_version)

if [ $bash_version = 4 ]; then
  b.color.cecho $ansi_green "✔ Yay! Your bash version is good enough!"
else
  b.color.cecho $ansi_red "✖ Yikes! Your bash is crappy!"
  b.color.cecho $ansi_yellow "➠ Going to upgrade it…"

  b.system.get_system_info # $OSSTR for more return info

  b.color.cecho $ansi_yellow '➠ Installing bash v.4+'
  if [ $OSCODE = "osx" ]; then
    brew install bash
  else
    sudo apt-get install build-essential
    wget http://ftp.gnu.org/gnu/bash/bash-4.3.tar.gz
    tar xf bash-4.3.tar.gz
    rm -f bash-4.3.tar.gz
    cd bash-4.3/
    ./configure
    make
    sudo make install
    cd ..
    rm -rf bash-4.3/
  fi
fi

b.system.install_package 'system' force
b.system.install_package 'tools' force
source "$MY_PATH/packages.sh"
