pkg_prereqs=('brew')
pkg_extract_path=~/
pkg_description='Vagrant — virtual dev environment'

function install_package() {
  brew cask install virtualbox
  brew cask install vagrant
  vagrant init chef/ubuntu-13.04
  vagrant up

}
