pkg_prereqs=('brew grep')
pkg_extract_path=~/
pkg_description="ruby — A PROGRAMMER'S BEST FRIEND"

function install_package() {
  brew install rbenv ruby-build rbenv-gem-rehash rbenv-gemset

  unset GREP_OPTIONS
  rbenv install $(rbenv install -l | grep "^  [[:digit:]]\.[[:digit:]]\.[[:digit:]]$" | tail -1)
  rbenv global $(rbenv install -l | grep "^  [[:digit:]]\.[[:digit:]]\.[[:digit:]]$" | tail -1)

  if [ ! $( b.framework.is_string_existed 'eval "$(rbenv init -)"' ~/.omgzsh ) = "1" ]
  then
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.omgzsh
    echo 'eval "$(rbenv init -)"' >> ~/.omgzsh
    source ~/.omgzsh
  fi

  if [ ! $( b.framework.is_string_existed 'eval "$(rbenv init -)"' ~/.bashrc ) = "1" ]
  then
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    source ~/.bashrc
  fi

  ruby -v
}
