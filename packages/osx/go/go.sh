pkg_prereqs=('brew' 'git')
pkg_extract_path=~/
pkg_description='go - an open source programming language'

function install_package() {
  brew install go

  source $MY_PATH/files/go/.omg_aliases/.paths.env
  echo "Go tools path: $GOTOOLS"

  switch_to_go_tools

  go get github.com/songgao/colorgo

  switch_to_go_path
}
