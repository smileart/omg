pkg_prereqs=('apt-get git nodejs')
pkg_extract_path=~/
pkg_description='vim - the best code editor ever'

function install_package() {
  b.system.pretend_super

  # remove old vims
  sudo apt-get remove --purge vim vim-runtime gvim vim-nox vim-gnome
  sudo apt-get remove --purge vim-tiny vim-common vim-gui-common

  # install dependencies
  sudo apt-get install -y curl
  sudo apt-get install -y exuberant-ctags
  sudo apt-get install -y build-essential cmake
  sudo apt-get install -y mercurial python python-dev python3 python3-dev ruby ruby-dev libx11-dev libxt-dev libgtk2.0-dev libncurses5 ncurses-dev
  sudo apt-get autoremove
  sudo apt-get install -y silversearcher-ag
  sudo apt-get install -y libclang-dev
  sudo apt-get install -y libperl-dev
  sudo apt-get install -y lua5.1 liblua5.1-dev
  # sudo apt-get build-dep vim

  # fix liblua/luajit paths and issues
  sudo mkdir /usr/include/lua5.1/include
  sudo cp /usr/include/lua5.1/*.h /usr/include/lua5.1/include

  cd /tmp
  git clone http://luajit.org/git/luajit-2.0.git
  cd luajit-2.0
  make
  sudo make install

  # configure vim dirs
  vim_dir="$HOME/.vim"
  vimruntime="/usr/local/share/vim/vim80"
  vim_tpm_dir="/tmp/vim80"

  # delete & install vim
  sudo rm -rf $vim_tpm_dir
  sudo rm -f /usr/bin/vim
  sudo rm -rf /usr/local/share/vim

  cd /tmp && git clone https://github.com/vim/vim.git vim80
  cd ./vim80

  ./configure --enable-perlinterp \
    --enable-python3interp \
    --enable-pythoninterp \
    --enable-rubyinterp \
    --enable-luainterp \
    --enable-gui=auto \
    --enable-gtk2-check \
    --enable-gnome-check \
    --enable-fail-if-missing \
    --enable-multibyte \
    --enable-largefile \
    --disable-netbeans \
    --with-luajit \
    --with-features=huge \
    --with-x \
    --with-ruby-command=/usr/bin/ruby \
    --with-lua-prefix=/usr/include/lua5.1 \
    --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu/

  make VIMRUNTIMEDIR=$vimruntime
  sudo make install
  sudo rm -rf $vim_tmp_dir

  rm -rf ~/.vim_old
  mv ~/.vimrc ~/.vimrc_old
  mv ~/.vim ~/.vim_old
  mv ~/.NERDTreeBookmarks ~/.NERDTreeBookmarks_old

  mkdir $vim_dir
  cd $vim_dir
  mkdir "$vim_dir/bundle"
  git clone https://github.com/Shougo/neobundle.vim "$vim_dir/bundle/neobundle.vim"

  # install neverland theme
  cd /tmp
  rm -rf ./neverland-vim-theme
  git clone https://github.com/trapd00r/neverland-vim-theme.git
  sudo cp -a /tmp/neverland-vim-theme/colors/* "$vimruntime/colors"

  ln -s ~/.vim/.vimrc ~/.vimrc
  mkdir ~/.vim/undodir

  sudo curl -o /usr/local/share/fonts/VeraMono-Powerline.ttf -L https://gist.githubusercontent.com/smileart/9741746/raw/72573cff6dd7a2a99d27c7339e08705976f5abeb/VeraMono-Powerline.ttf

  echo
  b.color.cecho_warning
  b.color.cecho $ansi_yellow 'Before using vim, reload your terminal OR `source ~/.bashrc or ~/.omgzsh'`
  b.color.cecho $ansi_yellow 'OR execute `export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"`'
  echo

  if [ -f "~/.omgzsh" ]
  then
    if [ ! $( b.framework.is_string_existed 'LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib' ~/.omgzsh ) = "1" ]
    then
      echo 'LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib' >> ~/.omgzsh
      echo 'export LD_LIBRARY_PATH' >> ~/.omgzsh
    fi
  fi

  if [ ! $( b.framework.is_string_existed 'LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib' ~/.bashrc ) = "1" ]
  then
    echo 'LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib' >> ~/.bashrc
    echo 'export LD_LIBRARY_PATH' >> ~/.bashrc
  fi
}
