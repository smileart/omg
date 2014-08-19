" Autocmd to reload config on edit
" autocmd! bufwritepost $MYVIMRC source $MYVIMRC
autocmd BufWritePost ~/.vim/.rcs/* source %
aut BufWritePost ~/.vim/.rcs/* AirlineRefresh

autocmd BufWritePost * exe ":TrailerTrim"
" Help File speedups, <enter> to follow tag, delete for back
au filetype help nnoremap <buffer><cr> <c-]>
au filetype help nnoremap <buffer><bs> <c-T>
au filetype help nnoremap <buffer>q :q<CR>
au filetype help set nonumber
set splitbelow " Split windows, ie Help, make more sense to me below
au filetype help wincmd _ " Maximze the help on open

" Tabstop settings for file types
autocmd FileType * set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType ruby setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType coffee setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType php set tabstop=4|set shiftwidth=4|set expandtab

" Setup file types
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,Guardfile,config.ru,*.rake} set ft=ruby
au BufRead,BufNewFile *.twig set filetype=html

" Autoread on hold
autocmd CursorHold * checktime
