-- map leader key to ,
vim.g.mapleader = ','

local map = vim.api.nvim_set_keymap

-- remap german letters
map('', 'ü', '<C-]>', { noremap = true, silent = true })
map('', 'ö', '[', { noremap = true, silent = true })
map('', 'ä', ']', { noremap = true, silent = true })
map('', 'Ö', '{', { noremap = true, silent = true })
map('', 'Ä', '}', { noremap = true, silent = true })
map('', 'ß', '/', { noremap = true, silent = true })

-- remove search highlights
map('', '<Leader><Esc>', ':set hlsearch!<CR>', { noremap = true, silent = true })

-- fzf
map('', '<C-p>', ':Files<CR>', { noremap = true, silent = true })
map('', '<C-b>', ':Buffers<CR>', { noremap = true, silent = true })
