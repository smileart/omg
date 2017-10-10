pkg_prereqs=('brew' 'git' 'node')
pkg_extract_path=~/
pkg_description='atom - A hackable text editor for the 21st Century'

function install_package() {
  b.system.brew_cask_install_new atom
  apm install sync-settings
  atom
}
