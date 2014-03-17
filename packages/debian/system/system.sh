pkg_prereqs=('apt-get')
pkg_extract_path=~/
pkg_description='Upgrade your system!'

function install_package() {
  sudo apt-get update
  sudo apt-get upgrade
}
