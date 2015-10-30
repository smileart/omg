pkg_prereqs=('ruby')
pkg_extract_path=~/
pkg_description='brew - the missing package manager for OS X'

function install_package() {
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew tap phinze/cask
  brew install phinze/cask/brew-cask
}
