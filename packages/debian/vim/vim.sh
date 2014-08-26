pkg_prereqs=('apt-get')
pkg_extract_path=~/
pkg_description='vim - the best code editor ever'

function install_package() {

  # remove old vims
  sudo apt-get remove vim-tiny vim vim-nox
  sudo apt-get install exuberant-ctags
  sudo apt-get install build-essential cmake
  sudo apt-get install mercurial python python-dev python3 python3-dev ruby ruby-dev libx11-dev libxt-dev libgtk2.0-dev libncurses5 ncurses-dev
  sudo apt-get autoremove
  sudo apt-get install silversearcher-ag

  # install vim
  sudo apt-get install mercurial
  sudo rm -rf /tmp/vim74
  cd /tmp
  hg clone https://vim.googlecode.com/hg/ vim74
  cd vim74
  ./configure \
    --enable-perlinterp \
    --enable-python3interp \
    --enable-pythoninterp \
    --enable-rubyinterp \
    --enable-cscope \
    --enable-gui=auto \
    --enable-gtk2-check \
    --enable-gnome-check \
    --with-features=huge \
    --enable-multibyte \
    --with-features=huge \
    --with-x \
    --with-python3-config-dir=/usr/lib/python3.3/config-3.3m-x86_64-linux-gnu
  ./make
  sudo make install
  sudo rm -rf /tmp/vim74

  rm -rf ~/.vim_old

  mv ~/.vimrc ~/.vimrc_old
  mv ~/.vim ~/.vim_old
  mv ~/.NERDTreeBookmarks ~/.NERDTreeBookmarks_old

  # configure vim
  vim_dir="$HOME/.vim"
  vimruntime=`vim -v -e -T dumb --cmd 'exe "set t_cm=\<C-M>"|echo $VIMRUNTIME|quit' | tr -d '\015' `

  mkdir $vim_dir
  cd $vim_dir
  mkdir "$vim_dir/bundle"
  git clone https://github.com/Shougo/neobundle.vim "$vim_dir/bundle/neobundle.vim"

  # install neverland theme
  cd /tmp
  git clone https://github.com/trapd00r/neverland-vim-theme.git
  sudo cp -a /tmp/neverland-vim-theme/colors/* "$vimruntime/colors"

  ln -s ~/.vim/.vimrc ~/.vimrc
  mkdir ~/.vim/undodir

  sudo curl -o /usr/local/share/fonts/VeraMono-Powerline.ttf  -L https://gist.githubusercontent.com/smileart/9741746/raw/72573cff6dd7a2a99d27c7339e08705976f5abeb/VeraMono-Powerline.ttf
}
