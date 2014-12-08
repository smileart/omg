pkg_prereqs=('brew')
pkg_extract_path=~/
pkg_description='Awesome set of useful tools'

function install_package() {

  brew install curl

  brew cask install xquartz
  brew install tree

  brew install feh
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

  brew tap homebrew/dupes
  brew install homebrew/dupes/grep

  brew install python3
  sudo easy_install pip
  sudo easy_install pygments
  pip install --upgrade pip
  sudo pip install --upgrade virtualenv

  sudo pip install --upgrade asciinema
  asciinema auth

  brew install youtube-dl

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
