#!/usr/bin/env bash
# http://drrb.github.io/gitsu/
pkg_prereqs=('brew' 'ruby')
pkg_extract_path=~/
pkg_description='git - the best version control system ever'

function install_package() {
  b.system.brew_install_new git

  b.color.cecho $ansi_yellow " Installing tig"
  b.system.brew_install_new tig

  b.color.cecho $ansi_yellow " Installing git-flow"
  b.system.brew_install_new git-flow

  b.color.cecho $ansi_yellow " Installing git-extras"
  b.system.brew_install_new git-extras

  b.color.cecho $ansi_yellow " Installing legit"
  b.system.brew_install_new legit
  legit install

  b.color.cecho $ansi_yellow " Installing GitUp"
  b.system.brew_cask_install_new gitup

  b.color.cecho $ansi_yellow " Installing diff-so-fancy"
  b.system.brew_install_new diff-so-fancy

  b.color.cecho $ansi_yellow " Installing git-up"
  if b.system.command_exists 'gem'; then
    gem install git-up
  fi

  b.color.cecho $ansi_yellow " Installing gitsu"
  if b.system.command_exists 'gem'; then
    gem install gitsu
  fi

  b.color.cecho $ansi_yellow " Installing git-open"
  if b.system.command_exists 'npm'; then
    npm install -g git-open
  fi

  b.color.cecho $ansi_yellow " Configuring git"
  git config --global mergetool.keepBackup false
  git config --global core.filemode false
  git config --global core.autocrlf input
  git config --global core.editor "vim"
  git config --global color.ui always
  git config --global push.default current
  git config --global branch.dev.remote origin
  git config --global branch.dev.merge refs/heads/dev
  git config --global alias.fix-commit 'git add -A; git-commit -v --amend'
  git config --global alias.stash-unapply '!git stash show -p | git apply -R'

  git clone https://github.com/fteem/git-semantic-commits.git /tmp/git-semantic-commits
  . /tmp/git-semantic-commits/install.sh
  rm -rf /tmp/git-semantic-commits

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
}
