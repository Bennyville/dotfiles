require("obsidian").setup({
	workspaces = {
		{
			name = "work",
			path = "~/Documents/Notes/Work",
		},
		{
			name = "brain",
			path = "~/Library/Mobile Documents/com~apple~CloudDocs/Documents/Obsidian/Brain/Brain",
		}
	},
	open_notes_in = "vsplit"
})

vim.keymap.set('', '<leader>of', ':ObsidianQuickSwitch<CR>')
vim.keymap.set('', '<leader>og', ':ObsidianSearch<CR>')
vim.keymap.set('', '<leader>on', ':ObsidianNew<CR>')
