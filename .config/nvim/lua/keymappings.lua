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

-- keep cursor position after joining lines
map('', 'J', 'mzJ`z', { noremap = true, silent = true })

-- fzf
map('', '<C-p>', ':Files<CR>', { noremap = true, silent = true })
map('', '<C-b>', ':Buffers<CR>', { noremap = true, silent = true })

-- nerdtree
map('', '<leader>n', ':NERDTreeFocus<CR>', { noremap = true, silent = true })

-- coc
-- GoTo code navigation.
map('n', 'gd', '<Plug>(coc-definition)', {silent = true})
map('n', 'gy', '<Plug>(coc-type-definition)', {silent = true})
map('n', 'gi', '<Plug>(coc-implementation)', {silent = true})
map('n', 'gr', '<Plug>(coc-references)', {silent = true})

map('n', 'K', ':lua show_documentation()', { noremap = false, silent = false });

function show_documentation()
	local filetype = vim.bo.filetype

	if filetype == 'vim'  or filetype == 'help' then
		vim.api.nvim_command('h ' .. filetype)
	elseif vim.call('coc#rpc#ready') then
		vim.fn.CocActionAsync('doHover')
	else
		vim.api.nvim_command(
		"!" .. vim.bo.keywordprg .. " " .. vim.fn.expand("<cword>")
		)
	end
end

