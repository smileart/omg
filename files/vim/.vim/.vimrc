" =================================================
" Who:     Smile @rT (http://about.me/smileart)
" What:    vim editor configuration
" Version: 0.0.1
" =================================================

" must be first line
set nocompatible
filetype off

" term setting
set term=xterm-256color

for f in split(glob('~/.vim/.rcs/*.vim'), '\n')
  exe 'source' f
endfor

" Automatically detect file types. (must turn on after Vundle)
if has('autocmd')
  filetype plugin indent on
endif

" Neobundle plugins list and configuration                ~/.vim/.rcs/neobundle.vim
" Platform specific (Windows, Mac, etc.) configuration    ~/.vim/.rcs/platforms.vim
" All of the Vim configuration.                           ~/.vim/.rcs/config.vim
" New commands                                            ~/.vim/.rcs/commands.vim
" All hotkeys, not dependant on plugins, are mapped here. ~/.vim/.rcs/mappings.vim
" Plugin-specific configuration.                          ~/.vim/.rcs/plugins.vim
" Small custom functions                                  ~/.vim/.rcs/functions.vim
" Auto commands                                           ~/.vim/.rcs/autocmds.vim
