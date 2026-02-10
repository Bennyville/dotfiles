return {
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme gruvbox]])
		end
	},
	-- lsp/completion/snippets
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			{
				'neovim/nvim-lspconfig', -- Required
				dependencies = {
					-- LSP Support
					{ 'williamboman/mason.nvim' }, -- Optional
					{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

					-- Autocompletion
					{ 'hrsh7th/nvim-cmp' }, -- Required
					{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
					{ 'hrsh7th/cmp-buffer' }, -- Optional
					{ 'hrsh7th/cmp-path' }, -- Optional
					{ 'saadparwaiz1/cmp_luasnip' }, -- Optional
					{ 'hrsh7th/cmp-nvim-lua' }, -- Optional

					-- Snippets
					{ 'L3MON4D3/LuaSnip' }, -- Required
					{ 'rafamadriz/friendly-snippets' }, -- Optional
				},
				config = function()
					require('plugins.config.lsp')
					require('luasnip.loaders.from_vscode').lazy_load()
					require('luasnip.loaders.from_lua').load({ paths = '~/.config/nvim/lua/snippets/' })
				end

			},
		},
	},

	-- treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		lazy = false,
		config = function()
			require('plugins.config.treesitter')
		end
	},
	{ 'nvim-treesitter/nvim-treesitter-context' },
	{ 'nvim-treesitter/playground' },

	-- fuzzy search
	{
		'ibhagwan/fzf-lua',
		dependencies = {
			{ 'junegunn/fzf',               build = './install --bin' },
			{ 'nvim-tree/nvim-web-devicons' } -- optional for icon support
		},
		config = function()
			require('plugins.config.fzf-lua')
		end
	},

	-- movements/mapping for surrounding tokens
	{ 'tpope/vim-surround' },

	-- code comments
	{ 'tpope/vim-commentary' },

	-- git
	{
		'tpope/vim-fugitive',
		config = function()
			require('plugins.config.fugitive')
		end
	},

	-- whereami/copy reference
	-- { dir = '~/Code/private/nvim-whereami' },
	{ 'bennyville/nvim-whereami' },

	{
		"danymat/neogen",
		config = function()
			require('plugins.config.neogen')
		end
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio"
		},
		config = function()
			require('plugins.config.dap')
		end
	}
}
