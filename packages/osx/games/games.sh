pkg_prereqs=('brew')
pkg_extract_path=~/
pkg_description='games — All work and no play makes Jack a dull boy'

function install_package() {
  brew install nethack
  brew install ninvaders
  brew install vitetris
  brew install typespeed
  brew install tintin
}
