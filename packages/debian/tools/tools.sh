pkg_prereqs=('apt-get')
pkg_extract_path=~/
pkg_description='Awesome set of useful tools'

function install_package() {
  sudo apt-get install curl
  sudo apt-get install tree
  sudo apt-get install feh
  sudo apt-get install ack-grep
  sudo apt-get install pv
  sudo apt-get install unar
  sudo apt-get install moreutils
  sudo apt-get install toilet
  sudo apt-get install figlet
  sudo apt-get install aview
  sudo apt-get install rig

  sudo apt-get install python-pip python-dev build-essential
  sudo pip install --upgrade pip
  sudo pip install --upgrade virtualenv

  sudo easy_install pygments

  sudo pip install --upgrade asciinema
  asciinema auth

  sudo pip install tldr

  sudo curl https://yt-dl.org/latest/youtube-dl -o /usr/local/bin/youtube-dl
  sudo chmod a+x /usr/local/bin/youtube-dl

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
    echo "USER=\"$pushover_user\"" >> ~/.config/pushover.conf
  fi
}
