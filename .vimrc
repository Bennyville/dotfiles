" Add line numbers
set number
set ruler
set cursorline

" Plugin
call plug#begin('~/.vim/plugged')

" Nerdtree 
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Fuzzy Search 
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' 

" Ctag generator
Plug 'ludovicchabant/vim-gutentags'

" Initialize plugin system
call plug#end()
