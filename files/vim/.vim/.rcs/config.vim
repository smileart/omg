" set colorscheme
colorscheme neverland-darker

" colorscheme modification for EasyMotion
hi link EasyMotionTarget ToDo
hi link EasyMotionShade  Comment

" basic oprions
set number                                  " Line numbers are good
set visualbell                              " No sounds
set autoread                                " Reload files changed outside vim
set ignorecase                              " When 'ignorecase' and 'smartcase' are both on, if a pattern
set smartcase                               " contains an uppercase letter, it is case sensitive, otherwise, it is not.
set copyindent                              " Enable automatic indentation of pasted lines
set whichwrap+=[,],<,>                      " Allow arrow keys to wrap lines
set showmode                                " Print the current mode in the last line
set noshowfulltag                           " Do not show full prototype of tags on completion
set showcmd                                 " Show commands as they are typed
set formatoptions+=cqron1                   " Some useful formatting options
set fileformats=unix,mac,dos                " Allows automatic line-end detection.
set grepprg=grep\ -nH\ $*                   " Make grep always print the file name.
set diffopt+=iwhite
set nofsync
set nosol
set shortmess+=a
set ttymouse=xterm2
set mousemodel=extend                       " With scroll and all features
set mousehide                               " Hide cursor on type
set noshowmode
set number                                  " Enable line numbers
set relativenumber                          " Make line numbers relative
set fillchars=vert:\|,stl:\ ,stlnc:—,       " windows borders setup
set list                                    " Same as :print, but display unprintable characters
set listchars=tab:→→,trail:·                " setup invisible chars visibility
set clipboard+=unnamed                      " bind system buffer
set encoding=utf-8 nobomb                   " set default encoding
set nottybuiltin
set cursorline
set t_Co=256                                " enable 256 colors in some terms (like Tmux)
set background=dark
set t_ut=                                   " http://sunaku.github.io/vim-256color-bce.html
set undodir=~/.vim/undodir                  " Set undos path
set undofile                                " Make undos persistent
set undolevels=1000                         " How many undos
set undoreload=10000                        " number of lines to save for undo
set title                                   " Update terminal window title
set textwidth=0
set wrapmargin=0

let g:vim_json_syntax_conceal = 0

runtime! plugin/sensible.vim
runtime! plugin/opinion.vim

filetype plugin indent on
filetype plugin on

set grepprg=ack\ -H\ --nocolor

" vim-auto-save
let g:auto_save = 1  " enable AutoSave on Vim startup
set autowriteall

" Prevent Ag to output while searching
let &shellpipe="&>"
