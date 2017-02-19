#!/usr/bin/env bash
export pkg_prereqs=('brew' 'ruby' 'node' 'go')
export pkg_extract_path=~/
export pkg_description='Awesome set of useful tools'

function install_package() {

  sudo chown -R "$USER" /usr/local/include
  sudo chown -R "$USER" /usr/local/lib

  brew install xz && brew link xz
  brew install libevent && brew link libevent
  brew install pcre && brew link pcre

  brew install curl

  brew cask install xquartz
  brew install tree

  brew cask install kap

  brew install nmap
  brew install ack
  brew install pv
  brew install unar
  brew install moreutils
  brew install coreutils
  brew install archey
  brew install watch
  brew install wget
  brew install toilet
  brew install figlet
  brew install aview
  brew install rig
  brew install ssh-copy-id
  brew install multitail
  brew tap tldr-pages/tldr && brew install tldr
  brew install htop
  brew install jq
  brew install borg
  brew install googler

  brew tap tidwall/jd
  brew install jd

  brew tap simeji/jid
  brew install jid

  brew install m-cli

  # MPlayer with libcaca
  brew unlink mplayer
  brew uninstall mplayer
  brew install libcaca && brew link libcaca
  brew install mplayer --with-libcaca

  # Screencast to Gif
  brew install ffmpeg imagemagick gifsicle

  brew tap homebrew/dupes
  brew install homebrew/dupes/grep

  brew install python3
  sudo easy_install pip
  sudo python3 -m pip install --upgrade --force-reinstall pip

  sudo -H pip3 install --upgrade Pygments
  sudo -H pip3 install --upgrade virtualenv

  sudo -H pip3 install --upgrade mitmproxy

  sudo -H pip3 install --upgrade asciinema
  asciinema auth

  brew install youtube-dl
  brew install cloc
  brew install icdiff

  brew install keybase

  gem install iStats
  gem install pru

  brew install puma/puma/puma-dev
  sudo puma-dev -setup
  puma-dev -install -install-port 81 -install-https-port 444

  npm install --global generate-contributing generate-license generate-readme
  npm install --global clipboard-cli
  npm install --global spoof

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
