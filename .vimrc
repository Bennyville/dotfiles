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
Plug 'tobyS/pdv'
Plug 'adoy/vim-php-refactoring-toolbox'
Plug 'phpactor/phpactor', {'for': 'php', 'branch': 'master', 'do': 'composer install --no-dev -o'}

" Mustache
Plug 'tobyS/vmustache'

" Typescript
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'

" Editorconfig
Plug 'editorconfig/editorconfig-vim'

" dim inactive windows
Plug 'blueyed/vim-diminactive'

" git integration
Plug 'tpope/vim-fugitive'

" Snippets
" Plug 'SirVer/ultisnips'

" Surround
Plug 'tpope/vim-surround'

" Vue
Plug 'posva/vim-vue'

" Session management
Plug 'tpope/vim-obsession'

" Blade templating syntax
Plug 'jwalton512/vim-blade'

" Elixir
Plug 'elixir-editors/vim-elixir'

" Phoenix Framework
Plug 'avdgaag/vim-phoenix'

" Elm
Plug 'elmcast/elm-vim'

" nginx
Plug 'chr4/nginx.vim'

" commentary
Plug 'tpope/vim-commentary'

" custom text objects
Plug 'kana/vim-textobj-user'
Plug 'jasonlong/vim-textobj-css'

" Mercurial
Plug 'ludovicchabant/vim-lawrencium'

" Display images as ASCII instead of binary, because you can
Plug 'ashisha/image.vim'

" XML
Plug 'othree/xml.vim'

" highlight yanked lines
Plug 'machakann/vim-highlightedyank'

" Rust
Plug 'rust-lang/rust.vim'

" neomake
Plug 'neomake/neomake'

" Initialize plugin system
call plug#end()

source ~/.vim/settings/settings.vim
source ~/.vim/settings/mappings.vim
source ~/.vim/settings/plugins.vim
