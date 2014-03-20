pkg_prereqs=('apt-get cmake git')
pkg_extract_path=~/
pkg_description='tmux — best terminal multiplyer'

function install_package() {
  sudo apt-get install cmake
  sudo apt-get install tmux
  cd /tmp
  git clone https://github.com/thewtex/tmux-mem-cpu-load
  cd tmux-mem-cpu-load/
  cmake .
  make
  sudo make install
  cd /tmp
  git clone git://github.com/zolrath/wemux.git /usr/local/share/wemux
  cd wemux/
  sudo ln -s /usr/local/share/wemux/wemux /usr/local/bin/wemux
  sudo cp /usr/local/share/wemux/wemux.conf.example /usr/local/etc/wemux.conf
}
