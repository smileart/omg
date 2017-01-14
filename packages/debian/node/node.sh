pkg_prereqs=('apt-get')
pkg_extract_path=~/
pkg_description='node.js — server-side JS platform'

function install_package() {
  b.system.pretend_super

  sudo apt-get update > /dev/null && sudo apt-get install -y cmake curl

  # https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager
  curl -sL https://deb.nodesource.com/setup_7.x | sudo bash -
  sudo apt-get install -y nodejs build-essential
  sudo npm install -g n
  sudo n latest

  if b.ui.ask_yes_or_not ">>> Would you like to install localtunnel tool? (https://localtunnel.me)"; then
    sudo npm install -g localtunnel
  fi
}
