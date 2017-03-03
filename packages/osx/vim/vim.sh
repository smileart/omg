pkg_prereqs=('brew' 'git' 'python')
pkg_extract_path=~/
pkg_description='vim - the best code editor ever'

function install_package() {

    # install vim
    brew install lua
    brew install macvim --override-system-vim --with-python3 --with-custom-icons --with-cscope --with-lua --HEAD
    brew install the_silver_searcher
    brew install cmake
    brew install ctags

    brew link --overwrite macvim

    rm -rf ~/.vim_old

    mv ~/.vimrc ~/.vimrc_old
    mv ~/.vim ~/.vim_old
    mv ~/.NERDTreeBookmarks ~/.NERDTreeBookmarks_old

    # configure vim
    vim_dir="$HOME/.vim"
    vimruntime=`mvim -v -e -T dumb --cmd 'exe "set t_cm=\<C-M>"|echo $VIMRUNTIME|quit' | tr -d '\015' `

    cd ~
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
    curl -o ~/Library/Fonts/VeraMono-Powerline.ttf  -L https://gist.githubusercontent.com/smileart/9741746/raw/72573cff6dd7a2a99d27c7339e08705976f5abeb/VeraMono-Powerline.ttf

    vim +NeoBundleInstall +qall
}
