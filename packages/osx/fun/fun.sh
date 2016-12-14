pkg_prereqs=('brew' 'cmake' 'git')
pkg_extract_path=~/
pkg_description='fun — all sorts of stupid and fun staff'

function install_package() {
  # TTY Solitaire
  brew install ncurses
  brew link --force ncurses

  cd /tmp
  git clone https://github.com/mpereira/tty-solitaire.git
  cd tty-solitaire
  make
  sudo make install

  # Steam Locomotive
  brew install sl

  # Fortune and cowsay
  brew install fortune cowsay

  # Terminal 'screensaver'
  brew install cmatrix
}
