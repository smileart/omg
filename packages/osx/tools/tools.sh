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
}
