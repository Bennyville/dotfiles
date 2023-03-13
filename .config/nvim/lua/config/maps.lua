-- map leader key to ,
vim.g.mapleader = ','

local map = vim.api.nvim_set_keymap

-- remove search highlights
map('', '<Leader><Esc>', ':set hlsearch!<CR>', { noremap = true, silent = true })

-- keep cursor position after joining lines
map('', 'J', 'mzJ`z', { noremap = true, silent = true })

-- fzf
map('', '<C-p>', ':Files<CR>', { noremap = true, silent = true })
map('', '<C-b>', ':Buffers<CR>', { noremap = true, silent = true })
map('', '<Leader>ag', ':Ag <C-R><C-W><CR>', { noremap = true, silent = true })

-- nerdtree
map('', '<leader>n', ':NERDTreeFocus<CR>', { noremap = true, silent = true })
map('', '<C-n>', ':NERDTree<CR>', { noremap = true, silent = true})
map('', '<C-t>', ':NERDTreeToggle<CR>', { noremap = true, silent = true})
map('', '<C-f>', ':NERDTreeFind<CR>', { noremap = true, silent = true})