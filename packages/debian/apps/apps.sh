pkg_prereqs=('apt-get')
pkg_extract_path=~/
pkg_description='apps — essential Debian Apps set'

function install_package() {
  b.system.pretend_super

  sudo apt-get update > /dev/null
  sudo apt-get install -y cmake wget

  if b.ui.ask_yes_or_not ">>> Do you want to install Google Chrome app?"; then
    wget -c wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    dpkg -i google-chrome-*.deb
    sudo apt-get install -f
    rm -f google-chrome-*.deb
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install Terminator app?"; then
    sudo apt-get install-y terminator
    cd /tmp
    git clone https://github.com/hdra/itermcolors2terminator.git
    cp /tmp/itermcolors2terminator/convert.py /usr/bin/iterm2term
    sudo chmod +x /usr/bin/iterm2term
  fi

  if b.ui.ask_yes_or_not ">>> Do you want to install BTSync Web app?"; then
    sudo apt-get purge btsync
    sudo echo 'deb http://linux-packages.resilio.com/resilio-sync/deb resilio-sync non-free' > /etc/apt/sources.list.d/resilio-sync.list
    wget -qO - https://linux-packages.resilio.com/resilio-sync/key.asc | sudo apt-key add -
    sudo apt-get install -y resilio-sync
    sudo systemctl enable resilio-sync
    systemctl --user enable resilio-sync
    sudo service resilio-sync start
  fi
}
