#!/usr/bin/env bash
pkg_prereqs=('brew' 'git')
pkg_extract_path=~/
pkg_description='Upgrade your system!'

function install_package() {

  if [[ ! -z "/Library/Developer/CommandLineTools/" ]]; then
      b.system.install_package "clitools" 8
  fi

  # prepare brew
  cd /usr/local
  git reset --hard origin/master
  chmod +x /usr/local/share

  # update brew
  brew update
  brew upgrade
  brew linkapps
  brew cask update
  brew tap caskroom/fonts
  brew cask install font-firacode-nerd-font

  sudo softwareupdate -i -a

  defaults write -g InitialKeyRepeat -int 10
  defaults write -g KeyRepeat -int 5
}
