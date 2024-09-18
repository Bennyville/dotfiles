return {
	-- colorscheme
	{
		'ellisonleao/gruvbox.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			require('plugins.config.colorscheme')
		end,
	},

	-- lsp/completion/snippets
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },    -- Required
			{ 'williamboman/mason.nvim' },  -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'hrsh7th/cmp-buffer' }, -- Optional
			{ 'hrsh7th/cmp-path' }, -- Optional
			{ 'saadparwaiz1/cmp_luasnip' }, -- Optional
			{ 'hrsh7th/cmp-nvim-lua' }, -- Optional

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },    -- Required
			{ 'rafamadriz/friendly-snippets' }, -- Optional
		},
		config = function()
			require('plugins.config.lsp')
			require('luasnip.loaders.from_vscode').lazy_load()
			require('luasnip.loaders.from_lua').load({paths = '~/.config/nvim/lua/snippets/'})
		end

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
			{ 'junegunn/fzf', build = './install --bin' },
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

	-- pretty lists
	{
		'folke/trouble.nvim',
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function()
			require('plugins.config.trouble')
		end
	},

	-- mercurial
	{ 'ludovicchabant/vim-lawrencium' },

	-- git
	{ 
		'tpope/vim-fugitive',
		config = function()
			require('plugins.config.fugitive')
		end
	},

	-- time tracking
	{ 'wakatime/vim-wakatime' },

	-- whereami/copy reference
	{ dir = '~/Code/private/nvim-whereami' },
	-- { 'bennyville/nvim-whereami' }

	-- copilot
	{ 
		'github/copilot.vim',
		config = function()
			require('plugins.config.copilot')
		end
	},

	--obsidian
	{
		"epwalsh/obsidian.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require('plugins.config.obsidian')
		end
	}
}
