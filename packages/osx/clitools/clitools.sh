pkg_prereqs=('xcode-select')
pkg_extract_path=~/
pkg_description='XCode CLI Tools - large suite of software development tools and libraries from Apple'

function install_package() {
    # OS X Command Line Tools
    xcode-select --install
}