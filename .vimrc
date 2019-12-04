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

" Lightline
Plug 'itchyny/lightline.vim'

" COC - Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" PHP
Plug 'StanAngeloff/php.vim'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'arnaud-lb/vim-php-namespace'

" Typescript
Plug 'leafgarland/typescript-vim'

" Editorconfig
Plug 'editorconfig/editorconfig-vim'

" Initialize plugin system
call plug#end()

set laststatus=2
if !has('gui_running')
    set t_Co=256
endif

colorscheme monokai
set termguicolors

