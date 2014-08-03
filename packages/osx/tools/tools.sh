pkg_prereqs=('brew')
pkg_extract_path=~/
pkg_description='Awesome set of useful tools'

function install_package() {
  brew install curl
  brew install tree
  brew install feh
  brew install ack
  brew install pv
  brew install unar
  brew install moreutils

  brew tap homebrew/dupes
  brew install homebrew/dupes/grep

  brew install python3
  pip install --upgrade pip
  sudo pip install --upgrade virtualenv
}
