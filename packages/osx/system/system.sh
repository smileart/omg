pkg_prereqs=('brew git')
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

  brew tap phinze/homebrew-cask
  brew install brew-cask
  brew unlink brew-cask && brew link brew-cask

  # update brew
  brew update
  brew upgrade
  brew linkapps
  brew cask update
  sudo softwareupdate -i -a
}
