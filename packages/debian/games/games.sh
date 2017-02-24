pkg_prereqs=('apt-get')
pkg_extract_path=~/
pkg_description='games — All work and no play makes Jack a dull boy'

function install_package() {
  sudo apt-get install -y bsdgames

  sudo apt-get install -y nethack-console
  sudo apt-get install -y ninvaders
  sudo apt-get install -y typespeed
  sudo apt-get install -y tintin++

  sudo apt-get install -y moon-buggy
  sudo apt-get install -y nsnake

  sudo apt-get install -y pacman4console

  # @TODO Install this games
  #
  # nudoku
  # vitetris
  # myman
  # greed
  # bastet
}
