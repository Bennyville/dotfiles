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

" Theme
Plug 'crusoexia/vim-monokai'

" PHP
Plug 'StanAngeloff/php.vim'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'arnaud-lb/vim-php-namespace'

" Typescript
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'

" Editorconfig
Plug 'editorconfig/editorconfig-vim'

" dim inactive windows
Plug 'blueyed/vim-diminactive'

" git integration
Plug 'tpope/vim-fugitive'

" Initialize plugin system
call plug#end()

source ~/.vim/settings/settings.vim
source ~/.vim/settings/plugins.vim
