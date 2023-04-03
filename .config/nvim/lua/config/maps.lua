-- map leader key to ,
vim.g.mapleader = ' '

local map = vim.api.nvim_set_keymap

-- remove search highlights
map('', '<Leader><Esc>', ':set hlsearch!<CR>', { noremap = true, silent = true })

-- keep cursor position after joining lines
map('', 'J', 'mzJ`z', { noremap = true, silent = true })

-- fzf
map('n', '<C-p>', ':Files<CR>', { noremap = true, silent = true })
map('n', '<C-b>', ':Buffers<CR>', { noremap = true, silent = true })
map('n', '<Leader>ag', ':Ag <C-R><C-W><CR>', { noremap = true, silent = true })

-- netrw
map('', '<leader>dd', ':Explore %:p:h<CR>', { noremap = true, silent = true })
map('', '<leader>da', ':Explore<CR>', { noremap = true, silent = true })
