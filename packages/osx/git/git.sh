pkg_prereqs=('brew')
pkg_extract_path=~/
pkg_description='git - best version control system ever'

function install_package() {
  brew install git
  git config --global mergetool.keepBackup false
  git config --global core.filemode false
  git config --global core.autocrlf input
  git config --global core.editor "vim"
  git config --global color.ui always
}
