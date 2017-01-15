pkg_prereqs=('git' 'grep')
pkg_extract_path=~/
pkg_description="ruby — A PROGRAMMER'S BEST FRIEND"

function install_package() {

  sudo apt-get install -y grep libreadline-dev

  cd
  rm -rf ~/.rbenv

  git clone git://github.com/sstephenson/rbenv.git .rbenv
  git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

  if [ ! $( b.framework.is_string_existed 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH' ~/.bashrc ) = "1" ]
  then
    echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
  fi

  if [ ! $( b.framework.is_string_existed 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH' ~/.omgzsh ) = "1" ]
  then
    echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.omgzsh
  fi

  export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
  eval "$(rbenv init -)"

  rbenv install $(rbenv install -l | grep -P "^  [[:digit:]]\.[[:digit:]]\.[[:digit:]]$" | tail -1)
  rbenv global $(rbenv install -l | grep -P "^  [[:digit:]]\.[[:digit:]]\.[[:digit:]]$" | tail -1)

  if [ ! $( b.framework.is_string_existed 'eval "$(rbenv init -)"' ~/.omgzsh ) = "1" ]
  then
    echo '>>>>>>>> rbenv init added to OMG'
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.omgzsh
    echo 'eval "$(rbenv init -)"' >> ~/.omgzsh
    source ~/.omgzsh
  fi

  if [ ! $( b.framework.is_string_existed 'eval "$(rbenv init -)"' ~/.bashrc ) = "1" ]
  then
    echo '>>>>>>>> rbenv init added to BASH'
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    source ~/.bashrc
  fi

  rbenv shims
  ruby -v
}
