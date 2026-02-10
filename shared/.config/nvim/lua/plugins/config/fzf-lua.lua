require("fzf-lua").setup({
    keymap = {
        fzf = {
            ["ctrl-q"] = "select-all+accept",
        },
    },
})

vim.keymap.set('n', '<leader>fg', '<cmd>lua require(\'fzf-lua\').live_grep()<cr>', {})
vim.keymap.set('n', '<leader>fG', '<cmd>lua require(\'fzf-lua\').grep_cword()<cr>', {})
vim.keymap.set('v', '<leader>fG', '<cmd>lua require(\'fzf-lua\').grep_visual()<cr>', {})
vim.keymap.set('n', '<leader>ff', '<cmd>lua require(\'fzf-lua\').files()<cr>', {})
vim.keymap.set('n', '<leader>fd', '<cmd>lua require(\'fzf-lua\').buffers()<cr>', {})
vim.keymap.set('n', '<leader>fs', '<cmd>lua require(\'fzf-lua\').lsp_document_symbols()<cr>', {})
vim.keymap.set('n', '<leader>fa', '<cmd>lua require(\'fzf-lua\').builtin()<cr>', {})
