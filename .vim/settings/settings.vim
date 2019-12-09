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

" search
set hlsearch
set incsearch

" always show status line
set laststatus=2

" show whitespace
set list
set listchars=tab:>-,trail:·

" disable backup and swap files
set noswapfile
set nobackup
set nowritebackup
