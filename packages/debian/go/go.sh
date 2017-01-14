pkg_prereqs=('apt-get' 'git')
pkg_extract_path=~/
pkg_description='go - an open source programming language'

function install_package() {
  sudo add-apt-repository ppa:ubuntu-lxc/lxd-stable
  sudo apt-get update > /dev/null
  sudo apt-get install -y golang

  source $MY_PATH/files/go/.omg_aliases/.paths.env
  echo "Go tools path: $GOTOOLS"

  switch_to_go_tools

  go get github.com/songgao/colorgo

  switch_to_go_path
}
