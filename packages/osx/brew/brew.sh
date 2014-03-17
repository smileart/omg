pkg_prereqs=('ruby')
pkg_extract_path=~/
pkg_description='brew - the missing package manager for OS X'

function install_package() {
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  brew tap phinze/homebrew-cask
  brew install brew-cask
}
