pkg_prereqs=('apt-get')
pkg_extract_path=~/
pkg_description='Upgrade/Update your system!'

function install_package() {
  b.system.pretend_super

  if b.ui.ask_yes_or_not ">>> Would you like to UPGRADE your system? (WARNING: COULD BE DANGEROUS!)"; then
    do-release-upgrade
    sudo apt-get upgrade
  fi

  sudo apt-get update
}
