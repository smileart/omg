pkg_prereqs=('apt-get')
pkg_extract_path=~/
pkg_description='Upgrade your system!'

function install_package() {
  do-release-upgrade
  sudo apt-get update
  sudo apt-get upgrade
}
