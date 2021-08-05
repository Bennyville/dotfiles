vim.cmd 'syntax on';
vim.cmd 'filetype plugin indent on';

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
vim.o.list = true
vim.o.listchars = "eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·"

-- disable backup and swap files
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false

-- ruler
vim.o.colorcolumn = "80,120"
