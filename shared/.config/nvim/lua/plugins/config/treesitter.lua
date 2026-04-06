require('nvim-treesitter').install {
	"bash",
	"css",
	"dockerfile",
	"eex",
	"elixir",
	"heex",
	"html",
	"javascript",
	"json",
	"lua",
	"markdown",
	"markdown_inline",
	"php",
	"python",
	"rust",
	"scss",
	"typescript",
	"vim",
	"yaml"

}

vim.api.nvim_set_hl(0, 'TreesitterContextBottom', { underline = true })
