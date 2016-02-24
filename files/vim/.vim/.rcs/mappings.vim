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
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

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
nnoremap <leader>h :UndotreeToggle<CR>

" vim as git mergetool
if &diff
  map <leader>1 :diffget LOCAL<CR>
  map <leader>2 :diffget BASE<CR>
  map <leader>3 :diffget REMOTE<CR>
endif

" Emmet
let g:user_emmet_leader_key='<C-D>'

" NeoComplete
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
inoremap <expr><CR> pumvisible() ? neocomplete#close_popup() : "\<CR>"

" Ferret
nmap <leader>z <Plug>(FerretAckWord)
