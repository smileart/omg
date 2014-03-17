pkg_prereqs=('apt-get')
pkg_extract_path=~/
pkg_description='git - best version control system ever'

function install_package() {
  sudo apt-get install libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev
  sudo apt-get install git
  sudo apt-get install tig
}
