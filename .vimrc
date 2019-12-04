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

" vim-gutentags settings
let g:gutentags_ctags_exclude = [
      \ '*.git', '*.svg', '*.hg',
      \ '*/tests/*',
      \ 'build',
      \ 'dist',
      \ '*sites/*/files/*',
      \ 'bin',
      \ 'node_modules',
      \ 'bower_components',
      \ 'cache',
      \ 'compiled',
      \ 'docs',
      \ 'example',
      \ 'bundle',
      \ 'vendor',
      \ '*.md',
      \ '*-lock.json',
      \ '*.lock',
      \ '*bundle*.js',
      \ '*build*.js',
      \ '.*rc*',
      \ '*.json',
      \ '*.min.*',
      \ '*.map',
      \ '*.bak',
      \ '*.zip',
      \ '*.pyc',
      \ '*.class',
      \ '*.sln',
      \ '*.Master',
      \ '*.csproj',
      \ '*.tmp',
      \ '*.csproj.user',
      \ '*.cache',
      \ '*.pdb',
      \ 'tags*',
      \ 'cscope.*',
      \ '*.css',
      \ '*.less',
      \ '*.scss',
      \ '*.exe', '*.dll',
      \ '*.mp3', '*.ogg', '*.flac',
      \ '*.swp', '*.swo',
      \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
      \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
      \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
      \ ]

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

