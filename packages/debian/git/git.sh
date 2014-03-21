pkg_prereqs=('apt-get')
pkg_extract_path=~/
pkg_description='git - best version control system ever'

function install_package() {
  sudo apt-get install libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev
  sudo apt-get install git
  sudo apt-get install tig
  sudo apt-get install git-flow

  git config --global mergetool.keepBackup false
  git config --global core.filemode false
  git config --global core.autocrlf input
  git config --global core.editor "vim"
  git config --global color.ui always
  git config --global push.default current
  git config --global branch.dev.remote origin
  git config --global branch.dev.merge refs/heads/dev

  git_email=$(b.ui.ask_for_input "Enter your git email")
  git config --global user.email "$git_email"

  git_username=$(b.ui.ask_for_input "Enter your git username")
  git config --global user.name "$git_username"

  git_mergetool=$(b.ui.ask_for_input "Enter your merge command")
  git config --global merge.tool $git_mergetool
}
