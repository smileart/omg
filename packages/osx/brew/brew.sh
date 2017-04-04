#!/usr/bin/env bash
pkg_prereqs=('ruby')
pkg_extract_path=~/
pkg_description='brew - the missing package manager for OS X'

function install_package() {
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  brew tap caskroom/cask
  brew unlink brew-cask && brew link brew-cask

  # http://docs.brew.sh/Troubleshooting.html
  cd /usr/local && sudo chown -R $(whoami) bin etc include lib sbin share var Frameworks
}
