-- Use <Tab> and <S-Tab> as trigger
vim.cmd 'imap <Tab> <Plug>(completion_smart_tab)'
vim.cmd 'imap <S-Tab> <Plug>(completion_smart_s_tab)'

-- Set completeopt to have a better completion experience
vim.o.completeopt="menuone,noinsert,noselect"

-- Avoid showing message extra message when using completion
vim.o.shortmess = vim.o.shortmess .. "c"
