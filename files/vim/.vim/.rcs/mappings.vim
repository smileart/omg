" Key mapping for tab navigation
nmap <Tab> gt
nmap <S-Tab> gT

" NERDTree mappings
map <C-\> :NERDTreeToggle <bar> :silent NERDTreeMirror<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

" Leader mapping
let mapleader=","

" Tagbar open
nnoremap <leader>t :TagbarToggle<CR>

" Choose Win
nmap  -  <Plug>(choosewin)

" Avoid ESC
imap jk <Esc>

" Tagbar open
nnoremap <silent> <leader>r :YRShow<CR>
let g:yankring_replace_n_nkey = ''
let g:yankring_replace_n_pkey = ''

" Easymotion config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" NERDCommentr toggle bind
nmap <C-_> <leader>c<Space>
vmap <C-_> <leader>c<Space>

" fix weird behaviour in xterm that results in arrow keys entering 'ABCD'
"noremap OD  <Left>
"noremap OC  <Right>
"noremap OA  <Up>
"noremap OB  <Down>

" Toggle pasting.
"map <leader>pp :setlocal paste!<cr>

" Make :W and :Q aliases of :w and :q.
command! W w
command! Q q
command! Wq Wq
command! WQ wq

" Multiple cursors
let g:multi_cursor_use_default_mapping=1

" CtrlP bindings
nnoremap <leader>g :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>m :CtrlPMRUFiles<CR>

" Undotree binding
nnoremap <leader>u :UndotreeToggle<cr>

" vim as git mergetool
if &diff
  map <leader>1 :diffget LOCAL<CR>
  map <leader>2 :diffget BASE<CR>
  map <leader>3 :diffget REMOTE<CR>
endif
