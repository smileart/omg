pkg_prereqs=('brew' 'git')
pkg_extract_path=~/
pkg_description='tmux — best terminal multiplyer'

function install_package() {
  b.system.brew_install_new cmake
  b.system.brew_install_new tmux
  brew cask install easysimbl
  b.system.brew_install_new tmux-mem-cpu-load

  # El Capitan mouse support
  b.system.brew_install_new ragel
  cd /tmp
  git clone git://github.com/brodie/mouseterm.git
  cd mouseterm
  make
  make install
  rm -rf ./mouseterm

  cd
  b.system.brew_install_new reattach-to-user-namespace
  b.system.brew_install_new wemux

  b.ini_set_option 'host_list' "(brew `whoami`)" '/usr/local/etc/wemux.conf'

  brew update
  b.system.brew_install_new tmate
}
