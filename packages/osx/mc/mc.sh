pkg_prereqs=('brew')
pkg_extract_path=~/
pkg_description='mc - best cli file manager ever'

function install_package() {
    b.system.brew_install_new mc
}
