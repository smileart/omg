pkg_prereqs=('brew cmake git')
pkg_extract_path=~/
pkg_description='tmux — best terminal multiplyer'

function install_package() {
  brew install tmux
  cd /tmp
  git clone https://github.com/thewtex/tmux-mem-cpu-load
  cd tmux-mem-cpu-load/
  cmake .
  make
  sudo make install

  cd
  brew install reattach-to-user-namespace
  brew install https://github.com/downloads/zolrath/wemux/wemux.rb

  brew update
  brew tap nviennot/tmate
  brew install tmate
}
