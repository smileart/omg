pkg_prereqs=('apt-get' 'git')
pkg_extract_path=~/
pkg_description='go - an open source programming language'

function install_package() {
  sudo add-apt-repository ppa:ubuntu-lxc/lxd-stable
  sudo apt-get update
  sudo apt-get install golang

  source $MY_PATH/files/go/.omg_aliases/.paths.env
  echo "Go tools path: $GOTOOLS"

  BACKUP=$GOPATH
  export GOPATH=$GOTOOLS

  go get github.com/songgao/colorgo

  export GOPATH=$BACKUP
}
