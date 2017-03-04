pkg_prereqs=('brew')
pkg_extract_path=~/
pkg_description='games — All work and no play makes Jack a dull boy'

function install_package() {
  b.system.brew_install_new nethack
  b.system.brew_install_new ninvaders
  b.system.brew_install_new typespeed
  b.system.brew_install_new tintin
  b.system.brew_install_new greed
  b.system.brew_install_new nudoku
  b.system.brew_install_new moon-buggy
  b.system.brew_install_new nsnake

  b.system.brew_install_new pacman4console
  b.system.brew_install_new myman

  b.system.brew_install_new vitetris
  b.system.brew_install_new bastet

  cd /tmp || exit 1
  git clone https://github.com/mpereira/tty-solitaire.git && cd tty-solitaire
  make
  sudo make install
}
