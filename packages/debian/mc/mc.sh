pkg_prereqs=('apt-get')
pkg_extract_path=~/
pkg_description='mc - best cli file manager ever'

function install_package() {
    sudo apt-get install mc
}
