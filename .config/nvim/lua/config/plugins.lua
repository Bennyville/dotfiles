require('lazy').setup({
	-- Theme
	-- { 'catppuccin/nvim', as = 'catppuccin' },
	-- { 'tanvirtin/monokai.nvim' },
	{ 
		'ellisonleao/gruvbox.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme gruvbox]])
		end,
	},

	-- LSP and completion
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
		}
	},

	-- treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate'
	},
	{ 'nvim-treesitter/nvim-treesitter-context' },
	{ 'nvim-treesitter/playground' },

	-- fuzzy search
	{ 'ibhagwan/fzf-lua',
		-- optional for icon support
		dependencies = {
			{ 'junegunn/fzf', build = './install --bin' },
			{ 'nvim-tree/nvim-web-devicons' }
		}
	},

	-- jump to marked files
	{
		'ThePrimeagen/harpoon',
		dependencies = {
			{ 'nvim-lua/plenary.nvim' }
		}
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
			require('trouble').setup {
				-- your configuration comes here
				-- or leave it empty to the default settings
				-- refer to the configuration section below
			}
		end
	},

	-- mercurial
	{ 'ludovicchabant/vim-lawrencium' },

	-- git
	{ 'tpope/vim-fugitive' },

	-- time tracking
	{ 'wakatime/vim-wakatime' },

	-- whereami
	{ '~/Code/private/nvim-whereami', dev = true},
	-- { 'bennyville/nvim-whereami' }

	-- elixir tools
	-- { "elixir-tools/elixir-tools.nvim", tag = "stable", dependencies = { "nvim-lua/plenary.nvim" } }

	-- copilot
	{ 'github/copilot.vim' },

	--obsidian
	({
		"epwalsh/obsidian.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	}),
})
