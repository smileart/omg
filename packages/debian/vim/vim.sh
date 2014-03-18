pkg_prereqs=('apt-get')
pkg_extract_path=~/
pkg_description='vim - the best code editor ever'

function install_package() {

  # remove old vims
  sudo apt-get remove vim-tiny vim vim-nox
  sudo apt-get install exuberant-ctags

  # install vim
  sudo apt-get install mercurial
  cd /tmp
  hg clone https://vim.googlecode.com/hg/ vim74
  cd vim74
  ./configure --enable-perlinterp --enable-pythoninterp --enable-rubyinterp --enable-cscope  --with-features=huge --prefix=/usr
  make
  sudo make install
  rm -rf /tmp/vim74

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
  alias vim='vim -v'

  mkdir ~/.vim/undodir

  cd /tmp
  git clone https://github.com/Lokaltog/powerline-fonts.git
  cd powerline-fonts
  cd DejaVuSansMono
  sudo cp 'DejaVu Sans Mono'* /usr/local/share/fonts/
}
