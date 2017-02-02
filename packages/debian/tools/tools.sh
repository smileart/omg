pkg_prereqs=('apt-get' 'ruby' 'node' 'go')
pkg_extract_path=~/
pkg_description='Awesome set of useful tools'

function install_package() {
  b.system.pretend_super

  sudo apt-get install -y curl
  sudo apt-get install -y tree
  sudo apt-get install -y feh
  sudo apt-get install -y ack-grep
  sudo apt-get install -y pv
  sudo apt-get install -y unar
  sudo apt-get install -y moreutils
  sudo apt-get install -y toilet
  sudo apt-get install -y figlet
  sudo apt-get install -y aview
  sudo apt-get install -y rig
  sudo apt-get install -y lshw
  sudo apt-get install -y localepurge
  sudo apt-get install -y multitail
  sudo apt-get install -y jq

  wget https://github.com/ok-borg/borg/releases/download/v0.0.2/borg_linux_amd64 -O /usr/local/bin/borg
  chmod 755 /usr/local/bin/borg

  sudo apt-get install -y python-pip python-dev build-essential libffi-dev libssl-dev libxml2-dev libxslt1-dev libjpeg8-dev zlib1g-dev g++
  sudo pip install --upgrade pip
  sudo pip install --upgrade virtualenv

  sudo easy_install pygments
  sudo pip install --upgrade asciinema
  asciinema auth

  sudo pip install tldr

  sudo pip install mitmproxy

  sudo curl https://yt-dl.org/latest/youtube-dl -o /usr/local/bin/youtube-dl
  sudo chmod a+x /usr/local/bin/youtube-dl

  sudo apt-get install -y mplayer
  sudo apt-get install -y cloc

  curl -s https://raw.githubusercontent.com/jeffkaufman/icdiff/release-1.8.1/icdiff \
    | sudo tee /usr/local/bin/icdiff > /dev/null \
    && sudo chmod ugo+rx /usr/local/bin/icdiff

  gem install pru

  npm install --global generate-contributing generate-license generate-readme
  npm install --global clipboard-cli
  npm install --global spoof

  function _install_go_tools() {
    source $MY_PATH/files/go/.omg_aliases/.paths.env
    echo "Go tools path: $GOTOOLS"

    switch_to_go_tools

    go get -u github.com/rapidloop/rtop
    go get -u github.com/evanmiller/hecate
    go get -u github.com/simeji/jid/cmd/jid
    go get -u github.com/tidwall/jd/cmd/jd

    switch_to_go_path
  }

  _install_go_tools

  if b.ui.ask_yes_or_not ">>> Would you like to install pushover.sh script? (http://pushover.net)"; then
    cd /tmp
    git clone https://github.com/jnwatts/pushover.sh.git
    cd pushover.sh
    chmod +x pushover.sh
    sudo cp pushover.sh /usr/local/bin/pushover

    pushover_token=$(b.ui.ask_for_input "Enter Pushover application's token")
    pushover_user=$(b.ui.ask_for_input "Enter your user/group key")
    pushover_conf_path="$HOME/.config/pushover.conf"

    if [ -f $pushover_conf_path ] ; then
      rm -f $pushover_conf_path
    fi

    echo "TOKEN=\"$pushover_token\"" > $pushover_conf_path
    echo "USER=\"$pushover_user\"" >> $pushover_conf_path
  fi

  if b.ui.ask_yes_or_not ">>> Would you like to install Pinboard tool? (https://github.com/badboy/pinboard-cli)"; then
    if b.system.command_exists "gem" ; then
      pinboard_api_key=$(b.ui.ask_for_input "Enter Pinboard application API key (https://pinboard.in/settings/password)")
      pinboard_conf_path="$HOME/.pinboard-token"

      if [ -f $pinboard_conf_path ] ; then
        rm -f $pinboard_conf_path
      fi

      echo "$pinboard_api_key" > $pinboard_conf_path
      gem install pinboard-cli
      pinboard -u
    else
      b.ui.sad_dude "Ruby gems package required! Install \`ruby\` first!"
    fi
  fi
}
