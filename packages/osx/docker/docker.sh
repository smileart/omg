pkg_prereqs=('brew')
pkg_extract_path=~/
pkg_description='docker - lightweight linux env isolation containers'

function install_package() {
  brew tap caskroom/cask
  brew install brew-cask
  brew cask install virtualbox

  brew install docker
  brew install docker-machine
  brew install docker-compose

  brew update
  brew upgrade
}
