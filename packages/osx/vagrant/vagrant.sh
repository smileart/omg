pkg_prereqs=('brew')
pkg_extract_path=~/
pkg_description='Vagrant — virtual dev environment'

function install_package() {
  brew cask install virtualbox
  brew cask install vagrant
  cd
  vagrant plugin install vagrant-cachier
  vagrant plugin install vagrant-gatling-rsync
  vagrant init chef/ubuntu-14.04
  vagrant up
}
