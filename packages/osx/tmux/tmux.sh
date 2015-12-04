pkg_prereqs=('brew cmake git')
pkg_extract_path=~/
pkg_description='tmux — best terminal multiplyer'

function install_package() {
  brew install tmux
  brew cask install easysimbl
  brew install tmux-mem-cpu-load

  # El Capitan mouse support
  brew install ragel
  cd /tmp
  git clone git://github.com/brodie/mouseterm.git
  cd mouseterm
  make
  make install
  rm -rf ./mouseterm

  cd
  brew install reattach-to-user-namespace
  brew install https://github.com/downloads/zolrath/wemux/wemux.rb

  brew update
  brew tap nviennot/tmate
  brew install tmate
}
