pkg_prereqs=('brew' 'git')
pkg_extract_path=~/
pkg_description='fun — all sorts of stupid and fun staff'

function install_package() {
  b.system.brew_install_new cmake
  b.system.brew_install_new ncurses
  brew link --force ncurses

  # Steam Locomotive
  b.system.brew_install_new sl

  # Fortune and cowsay
  b.system.brew_install_new fortune cowsay

  # Terminal 'screensaver'
  b.system.brew_install_new cmatrix
}
