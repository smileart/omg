pkg_prereqs=('brew git')
pkg_extract_path=~/
pkg_description='vim - the best code editor ever'

function install_package() {

    # install vim
    brew install macvim --override-system-vim --with-python3 --custom-icons

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
    git clone https://github.com/trapd00r/neverland-vim-theme.git
    sudo cp -a /tmp/neverland-vim-theme/colors/* "$vimruntime/colors"

    ln -s ~/.vim/.vimrc ~/.vimrc
    alias vim='mvim -v'

    mkdir ~/.vim/undodir

    cd /tmp
    git clone https://github.com/Lokaltog/powerline-fonts.git
    cd powerline-fonts
    cd DejaVuSansMono
    cp 'DejaVu Sans Mono'* ~/Library/Fonts
}
