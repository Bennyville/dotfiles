vim.cmd 'syntax on';
vim.cmd 'filetype plugin indent on';

vim.o.background = 'dark';

-- hide unsaved buffers
vim.o.hidden = true

-- use case insensitive search, except when using capital letters
vim.o.ignorecase = true
vim.o.smartcase = true

-- indentation
vim.wo.wrap = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.bo.autoindent = true
vim.bo.smartindent = true

-- line numbers
vim.o.number = true
vim.o.relativenumber = true
vim.o.ruler = true
vim.o.cursorline = true

-- search
vim.o.hlsearch = true
vim.o.incsearch = true

-- always show status line
vim.o.laststatus = 2

-- show whitespace
vim.o.listchars = "eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·"

-- disable backup and swap files
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false

-- ruler
vim.o.colorcolumn = "80,120"

-- give more space for displaying messages.
vim.go.cmdheight = 2

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- colors
vim.o.termguicolors = true

-- visible lines when scroll
vim.o.scrolloff = 8

-- netrw
vim.g.netrw_winsize = 25
vim.g.netrw_localrmdir='rm -r'
