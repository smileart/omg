" Airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme =  'powerlineish'
let g:airline_enable_fugitive=1
let g:airline_enable_syntastic=1
let g:airline_enable_bufferline=1

"powerline symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '🔒'
let g:airline_symbols.linenr = '✄'
let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#left_alt_sep = '⮁'
let g:airline#extensions#tabline#right_sep = '⮂'
let g:airline#extensions#tabline#right_alt_sep = '⮃'

" CtrlP config
let g:ctrlp_working_path_mode = 'rw'

" Syntastic settings
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }
let g:syntastic_html_checkers = ['handlebars']
let g:syntastic_error_symbol = '✖'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_full_redraws = 1

" NERDTree
let g:NERDTreeShowBookmarks = 0
let g:NERDTreeChDirMode=2
let g:NERDTreeMinimalUI=1
let g:nerdtree_tabs_focus_on_files = 1
let NERDTreeDirArrows=1
let NERDChristmasTree=1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")
  \&& b:NERDTreeType == "primary") | q | endif

" Vim Indent Guides
set ts=4 sw=4
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup = 1

" Choose Win
" if you want to use overlay feature
let g:choosewin_overlay_enable          = 1
" overlay font broke on mutibyte buffer?
let g:choosewin_overlay_clear_multibyte = 1

" AutoSave
let g:auto_save = 1

" Easy Tags
set tags=~/.vimtags
let g:easytags_dynamic_files = 1
let g:easytags_updatetime_min = 1
let easytags_resolve_links = 1
let g:easytags_on_cursorhold = 0
let g:easytags_always_enabled = 0
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_autoclose = 1

" Vim Move
let g:move_key_modifier = 'C'

" Multiple Curosr Higlight
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual

" CtrlP setup
let g:ctrlp_working_path_mode = 0
let g:ctrlp_extensions = ['mark', 'menu', 'cmdline']

" Vim signify
let g:signify_vcs_list = [ 'git' ]

" Undotree
if !exists('g:undotree_WindowLayout')
    let g:undotree_WindowLayout = 2
endif
