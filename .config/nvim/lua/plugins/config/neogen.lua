require('neogen').setup {
    enabled = true,             --if you want to disable Neogen
    input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<Leader>nf', ':lua require(\'neogen\').generate()<CR>', opts)
