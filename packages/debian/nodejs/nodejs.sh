pkg_prereqs=('apt-get cmake')
pkg_extract_path=~/
pkg_description='node.js — server-side JS platform'

function install_package() {
  sudo add-apt-repository ppa:chris-lea/node.js
  sudo apt-get update
  sudo apt-get install nodejs
  sudo npm install -g n
  sudo n latest
}
