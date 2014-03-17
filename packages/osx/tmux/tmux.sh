pkg_prereqs=('brew')
pkg_extract_path=~/
pkg_description='tmux — best terminal multiplyer'

function install_package() {
  brew install tmux
}
