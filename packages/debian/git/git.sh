# http://drrb.github.io/gitsu/
pkg_prereqs=('apt-get pip')
pkg_extract_path=~/
pkg_description='git - best version control system ever'

function install_package() {
  sudo apt-get install libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev

  sudo apt-get install git
  sudo apt-get install tig
  sudo apt-get install git-flow

  sudo apt-get install python3-pip
  pip install https://pypi.python.org/packages/source/G/GitPython/GitPython-0.3.2.RC1.tar.gz#md5=849082fe29adc653a3621465213cab96
  pip install legit
  legit install

  if b.system.command_exists 'gem'; then
    gem install gitsu
  fi

  git config --global mergetool.keepBackup false
  git config --global core.filemode false
  git config --global core.autocrlf input
  git config --global core.editor "vim"
  git config --global color.ui always
  git config --global push.default current
  git config --global branch.dev.remote origin
  git config --global branch.dev.merge refs/heads/dev
  git config --global alias.stash-unapply '!git stash show -p | git apply -R'

  if [[ $(b.string.is_empty $(git config --global user.email)) == 1 ]]; then
    git_email=$(b.ui.ask_for_input "Enter your git email")
    git config --global user.email "$git_email"
  fi

  if [[ $(b.string.is_empty $(git config --global user.name)) == 1 ]]; then
    git_username=$(b.ui.ask_for_input "Enter your git username")
    git config --global user.name "$git_username"
  fi

  if [[ $(b.string.is_empty $(git config --global merge.tool)) == 1 ]]; then
    git_mergetool=$(b.ui.ask_for_input "Enter your merge command")
    git config --global merge.tool $git_mergetool
  fi

  (cd /tmp && git clone --depth 1 https://github.com/tj/git-extras.git && cd git-extras && sudo make install)
}
