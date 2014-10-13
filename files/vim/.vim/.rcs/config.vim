" set colorscheme
colorscheme neverland-darker

" colorscheme modification for EasyMotion
hi link EasyMotionTarget ToDo
hi link EasyMotionShade  Comment

" set syntax highlight
" enable syntax highlight
syn on

" set additional statusline height
set laststatus=2

" turn off swap files
set noswapfile
set nobackup
set nowb

" basic oprions
set number                                  " Line numbers are good
set backspace=indent,eol,start              " Allow backspace in insert mode
set history=1000                            " Store lots of :cmdline history
set showcmd                                 " Show incomplete cmds down the bottom
set showmode                                " Show current mode down the bottom
set visualbell                              " No sounds
set autoread                                " Reload files changed outside vim
set ignorecase                              " When 'ignorecase' and 'smartcase' are both on, if a pattern
set smartcase                               " contains an uppercase letter, it is case sensitive, otherwise, it is not.
set tabstop=2                               " Set tabstops to 2 spaces
set shiftwidth=2                            " Set indentation shift-width to 2 spaces
set expandtab
set smarttab                                " Use smart tabs... we are not as dumb!
set autoindent                              " Enable automatic indentation
set copyindent                              " Enable automatic indentation of pasted lines
set incsearch                               " Use incremental search
set ruler                                   " Show line number & column
set whichwrap+=[,],<,>                      " Allow arrow keys to wrap lines
set nowrap                                  " Don't wrap long lines
set showmode                                " Print the current mode in the last line
set ttyfast                                 " Lots of console stuff that may slow down Vim
set noshowfulltag                           " Do not show full prototype of tags on completion
set showcmd                                 " Show commands as they are typed
set formatoptions+=cqron1                   " Some useful formatting options
set showmatch                               " Show matching parens
set fileformats=unix,mac,dos                " Allows automatic line-end detection.
set grepprg=grep\ -nH\ $*                   " Make grep always print the file name.
set lazyredraw                              " When this option is set, the screen will not be redrawn while executing macros, registers and other commands
set hidden
set diffopt+=iwhite
set nofsync
set nosol
set shortmess+=a
set ttymouse=xterm2
set mouse=a                                 " Enable mouse in terminal
set mousemodel=extend                       " With scroll and all features
set mousehide                               " Hide cursor on type
set noshowmode
set number                                  " Enable line numbers
set relativenumber                          " Make line numbers relative
set transparency=0                          " Disable term transparency
set fillchars=vert:\|,stl:\ ,stlnc:—,       " windows borders setup
set list                                    " Same as :print, but display unprintable characters
set listchars=tab:→→,trail:·                " setup invisible chars visibility
set clipboard+=unnamed                      " bind system buffer
set encoding=utf-8 nobomb                   " set default encoding
set timeout ttimeoutlen=100 timeoutlen=5000 " set keys timeout for multikey bindings
set nottybuiltin
set cursorline
set t_Co=256                                " enable 256 colors in some terms (like Tmux)
set background=dark
set undodir=~/.vim/undodir                  " Set undos path
set undofile                                " Make undos persistent
set undolevels=1000                         " How many undos
set undoreload=10000                        " number of lines to save for undo
set title                                   " Update terminal window title
set t_ut=                                   " http://sunaku.github.io/vim-256color-bce.html
set textwidth=0
set wrapmargin=0

filetype plugin indent on
filetype plugin on

set grepprg=ack\ -H\ --nocolor

if has("folding")
  " set foldminlines=5     " Don't fold stuff with less lines
  set foldmethod=indent    " Use syntax-aware folding
  set nofoldenable     " Don't enable automatic folding!
  set foldnestmax=3       "deepest fold is 3 levels
endif

" vim-auto-save
let g:auto_save = 1  " enable AutoSave on Vim startup
set autowriteall

" Prevent Ag to output while searching
let &shellpipe="&>"
