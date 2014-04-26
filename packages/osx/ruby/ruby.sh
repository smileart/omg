pkg_prereqs=('brew grep')
pkg_extract_path=~/
pkg_description="ruby — A PROGRAMMER'S BEST FRIEND"

function install_package() {
  brew install rbenv ruby-build rbenv-gem-rehash rbenv-gemset

  if [ ! $( b.framework.is_line_existed 'eval "$(rbenv init -)"' ~/.omgzsh ) = "1" ]
  then
    echo 'eval "$(rbenv init -)"' >> ~/.omgzsh
    source ~/.omgzsh
  fi

  if [ ! $( b.framework.is_line_existed 'eval "$(rbenv init -)"' ~/.bashrc ) = "1" ]
  then
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    source ~/.bashrc
  fi

  rbenv install 2.1.1
}
