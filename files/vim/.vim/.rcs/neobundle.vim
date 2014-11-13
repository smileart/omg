if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Bundles here:
NeoBundle 'kris89/vim-multiple-cursors'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'bling/vim-airline'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'chrisbra/csv.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'https://github.com/Valloric/YouCompleteMe.git' , {
            \ 'build' : {
            \    'unix' : 'git submodule update --init --recursive; ./install.sh --clang-completer',
            \    'mac' : 'git submodule update --init --recursive; ./install.sh --clang-completer --system-libclang'
            \ },
      \ }
NeoBundle 'vim-scripts/ZoomWin'
NeoBundle 't9md/vim-choosewin'
NeoBundle 'godlygeek/tabular'
NeoBundle '907th/vim-auto-save'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'vim-misc'
NeoBundle 'xolox/vim-session'
NeoBundle 'xolox/vim-easytags'
NeoBundle 'matze/vim-move'
NeoBundle 'csexton/trailertrash.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'YankRing.vim'
NeoBundle 'sgur/ctrlp-extensions.vim'
NeoBundle 'mattn/ctrlp-mark'
NeoBundle 'mbbill/undotree'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'milkypostman/vim-togglelist'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'jeetsukumaran/vim-markology'
NeoBundle 'artnez/vim-wipeout'
NeoBundle 'kien/tabman.vim'
NeoBundle 'goldfeld/vim-seek'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'EvanDotPro/nerdtree-chmod'
NeoBundle 'vim-scripts/matchit.zip'
NeoBundle 'openurl.vim'

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
