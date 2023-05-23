vim.keymap.set('n', '<leader>fg', '<cmd>lua require(\'fzf-lua\').live_grep()<cr>', {})
vim.keymap.set('n', '<leader>ff', '<cmd>lua require(\'fzf-lua\').files()<cr>', {})
vim.keymap.set('n', '<leader>fd', '<cmd>lua require(\'fzf-lua\').buffers()<cr>', {})
vim.keymap.set('n', '<leader>fs', '<cmd>lua require(\'fzf-lua\').git_files()<cr>', {})
vim.keymap.set('n', '<leader>fa', '<cmd>lua require(\'fzf-lua\').help_tags()<cr>', {})
