-- map leader key to ,
vim.g.mapleader = ' '

-- remove search highlights
vim.keymap.set('', '<Leader><Esc>', ':set hlsearch!<CR>')

-- keep cursor position after joining lines
vim.keymap.set('', 'J', 'mzJ`z')

-- fzf
vim.keymap.set('n', '<C-p>', ':Files<CR>')
vim.keymap.set('n', '<C-b>', ':Buffers<CR>')
vim.keymap.set('n', '<Leader>ag', ':Ag <C-R><C-W><CR>')

-- netrw
vim.keymap.set('', '<leader>dd', ':Explore %:p:h<CR>')
vim.keymap.set('', '<leader>da', ':Explore<CR>')

vim.keymap.set({'v', 'x', 'n'}, '<leader>y', '"+y')

