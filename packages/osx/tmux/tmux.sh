pkg_prereqs=('brew' 'git')
pkg_extract_path=~/
pkg_description='tmux — best terminal multiplyer'

function install_package() {
  brew install cmake
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
  brew install wemux

  b.ini_set_option 'host_list' "(brew `whoami`)" '/usr/local/etc/wemux.conf'

  brew update
  brew install tmate
}
