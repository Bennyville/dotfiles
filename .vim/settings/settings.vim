" color scheme
colorscheme monokai
set termguicolors

if !has('gui_running')
    set t_Co=256
endif
 
" use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" indentation
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" line numbers
set number relativenumber
set ruler
set cursorline

" highlight search
set hlsearch

" always show status line
set laststatus=2
