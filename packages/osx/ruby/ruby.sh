#!/usr/bin/env bash
pkg_prereqs=('brew')
pkg_extract_path=~/
pkg_description="ruby — A PROGRAMMER'S BEST FRIEND"

function install_package() {
  b.system.brew_install_new grep rbenv ruby-build rbenv-gemset

  unset GREP_OPTIONS
  rbenv install $(rbenv install -l | grep -v - | tail -1 | sed -e 's/^ *//')
  rbenv global $(rbenv install -l | grep -v - | tail -1 | sed -e 's/^ *//')

  if [ ! $( b.framework.is_string_existed 'eval "$(rbenv init -)"' ~/.omgzsh ) = "1" ]
  then
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.omgzsh
    echo 'eval "$(rbenv init - --no-rehash)"' >> ~/.omgzsh
    source ~/.omgzsh
  fi

  if [ ! $( b.framework.is_string_existed 'eval "$(rbenv init -)"' ~/.bashrc ) = "1" ]
  then
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init - --no-rehash)"' >> ~/.bashrc
    source ~/.bashrc
  fi

  eval "$(rbenv init -)"
  ruby -v
}
