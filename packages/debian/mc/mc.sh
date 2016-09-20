pkg_prereqs=('apt-get')
pkg_extract_path=~/
pkg_description='mc - best cli file manager ever'

function install_package() {
    b.system.pretend_super
    sudo apt-get install mc
}
