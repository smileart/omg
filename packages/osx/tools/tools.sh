#!/usr/bin/env bash
export pkg_prereqs=('brew' 'ruby' 'node' 'go')
export pkg_extract_path=~/
export pkg_description='Awesome set of useful tools'

function install_package() {
  sudo chown -R "$USER" /usr/local/include
  sudo chown -R "$USER" /usr/local/lib

  b.system.brew_install_new xz && brew unlink xz && brew link xz
  b.system.brew_install_new libevent && brew unlink libevent && brew link libevent
  b.system.brew_install_new pcre && brew unlink pcre && brew link pcre

  b.system.brew_install_new curl

  b.system.brew_cask_install_new xquartz
  b.system.brew_install_new tree

  b.system.brew_cask_install_new kap

  brew tap tldr-pages/tldr && b.system.brew_install_new tldr
  b.system.brew_install_new nmap
  b.system.brew_install_new ack
  b.system.brew_install_new pv
  b.system.brew_install_new unar
  b.system.brew_install_new moreutils
  b.system.brew_install_new coreutils
  b.system.brew_install_new archey
  b.system.brew_install_new watch
  b.system.brew_install_new wget
  b.system.brew_install_new toilet
  b.system.brew_install_new figlet
  b.system.brew_install_new aview
  b.system.brew_install_new rig
  b.system.brew_install_new ssh-copy-id
  b.system.brew_install_new multitail
  b.system.brew_install_new htop-osx
  b.system.brew_install_new jq
  b.system.brew_install_new borg
  b.system.brew_install_new googler
  b.system.brew_install_new task

  brew tap tidwall/jd && b.system.brew_install_new jd
  brew tap simeji/jid && b.system.brew_install_new jid

  b.system.brew_install_new m-cli

  # MPlayer with libcaca
  brew unlink mplayer
  brew uninstall --force mplayer
  b.system.brew_install_new libcaca && brew unlink libcaca && brew link libcaca
  b.system.brew_install_new mplayer --with-libcaca

  # Screencast to Gif
  b.system.brew_install_new ffmpeg
  b.system.brew_install_new imagemagick
  b.system.brew_install_new gifsicle

  brew tap homebrew/dupes && b.system.brew_install_new homebrew/dupes/grep

  pip3 install --upgrade Pygments
  pip3 install --upgrade virtualenv

  pip3 install --upgrade mitmproxy

  pip3 install --upgrade asciinema
  asciinema auth

  b.system.brew_install_new youtube-dl
  b.system.brew_install_new cloc
  b.system.brew_install_new icdiff

  b.system.brew_cask_install_new keybase

  gem install iStats
  gem install pru

  b.system.brew_install_new puma/puma/puma-dev
  sudo puma-dev -setup
  puma-dev -install -install-port 81 -install-https-port 444

  npm install --global generate-contributing generate-license generate-readme
  npm install --global clipboard-cli
  npm install --global spoof
  npm install --global fkill-cli

  if ! [ -f /usr/local/bin/ktimez ]; then
    cd /usr/local/bin || exit 1
    sudo curl -LO https://raw.githubusercontent.com/hellais/kill-time-zones/master/ktimez.sh
    mv ktimez.sh ktimez
    sudo chmod +x ktimez
  fi

  function _install_go_tools() {
    # shellcheck source=../../files/go/.omg_aliases/.paths.env
    # shellcheck disable=SC1091
    source "$MY_PATH/files/go/.omg_aliases/.paths.env"
    echo "Go tools path: $GOTOOLS"

    switch_to_go_tools

    go get -u github.com/rapidloop/rtop
    go get -u github.com/evanmiller/hecate

    switch_to_go_path
  }

  _install_go_tools

  if b.ui.ask_yes_or_not ">>> Would you like to install pushover.sh script? (http://pushover.net)"; then
    cd /tmp || exit 1
    git clone https://github.com/jnwatts/pushover.sh.git
    cd pushover.sh || exit 1
    chmod +x pushover.sh
    sudo cp pushover.sh /usr/local/bin/pushover

    pushover_token=$(b.ui.ask_for_input "Enter Pushover application's token")
    pushover_user=$(b.ui.ask_for_input "Enter your user/group key")
    pushover_conf_path="$HOME/.config/pushover.conf"

    if [ -f "$pushover_conf_path" ] ; then
      rm -f "$pushover_conf_path"
    fi

    echo "TOKEN=\"$pushover_token\"" > "$pushover_conf_path"
    echo "USER=\"$pushover_user\"" >> "$pushover_conf_path"
  fi

  if b.ui.ask_yes_or_not ">>> Would you like to install Pinboard tool? (https://github.com/badboy/pinboard-cli)"; then
    if b.system.command_exists "gem" ; then
      pinboard_api_key=$(b.ui.ask_for_input "Enter Pinboard application API key (https://pinboard.in/settings/password)")
      pinboard_conf_path="$HOME/.pinboard-token"

      if [ -f "$pinboard_conf_path" ] ; then
        rm -f "$pinboard_conf_path"
      fi

      echo "$pinboard_api_key" > "$pinboard_conf_path"
      gem install pinboard-cli
      pinboard -u
    else
      b.ui.sad_dude "Ruby gems package required! Install \`ruby\` first!"
    fi
  fi
}
