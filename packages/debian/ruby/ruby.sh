pkg_prereqs=('git grep')
pkg_extract_path=~/
pkg_description="ruby — A PROGRAMMER'S BEST FRIEND"

function install_package() {

  cd
  rm -rf ~/.rbenv

  git clone git://github.com/sstephenson/rbenv.git .rbenv
  source ~/.bashrc
  source ~/.omgzsh

  git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
  echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.omgzsh

  source ~/.bashrc
  source ~/.omgzsh

  rbenv install 2.1.2
  rbenv global 2.1.2

  if [ ! $( b.framework.is_line_existed 'eval "$(rbenv init -)"' ~/.omgzsh ) = "1" ]
  then
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.omgzsh
    echo 'eval "$(rbenv init -)"' >> ~/.omgzsh
    source ~/.omgzsh
  fi

  if [ ! $( b.framework.is_line_existed 'eval "$(rbenv init -)"' ~/.bashrc ) = "1" ]
  then
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    source ~/.bashrc
  fi

  ruby -v
}
