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
    pushover_conf_path="~/.config/pushover.conf"

    if [ -f $pushover_conf_path] ; then
      rm -f $pushover_conf_path
    fi

    echo "TOKEN=\"$pushover_token\"" > ~/.config/pushover.conf
    echo "USER=\"$pushover_token\"" >> ~/.config/pushover.conf
  fi
}
