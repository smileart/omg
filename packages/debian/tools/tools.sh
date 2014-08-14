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
  sudo apt-get install rig

  sudo apt-get install python-pip python-dev build-essential
  sudo pip install --upgrade pip
  sudo pip install --upgrade virtualenv

  sudo pip install --upgrade asciinema
  asciinema auth
}
