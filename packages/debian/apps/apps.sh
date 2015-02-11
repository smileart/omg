pkg_prereqs=('apt-get cmake wget')
pkg_extract_path=~/
pkg_description='apps — essential Debian Apps set'

function install_package() {

  if b.ui.ask_yes_or_not ">>> Do you want to install Google Chrome app?"; then
    wget -c wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    dpkg -i google-chrome-*.deb
    sudo apt-get install -f
    rm -f google-chrome-*.deb
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Terminator app?"; then
    sudo apt-get install terminator
    cd /tmp
    git clone https://github.com/hdra/itermcolors2terminator.git
    cp /tmp/itermcolors2terminator/convert.py /usr/bin/iterm2term
    sudo chmod +x /usr/bin/iterm2term
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install BTSync Web app?"; then
    # https://github.com/tuxpoldo/btsync-deb
    sh -c "$(curl -fsSL http://debian.yeasoft.net/add-btsync-repository.sh)"
    `which sudo` apt-get update
    `which sudo` apt-get install btsync
    `which sudo` dpkg-reconfigure btsync
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install BTSync GUI app?"; then
    # https://github.com/tuxpoldo/btsync-deb
    sh -c "$(curl -fsSL http://debian.yeasoft.net/add-btsync-repository.sh)"
    `which sudo` apt-get update
    `which sudo` apt-get install btsync-gui
  fi
}
