return require('packer').startup(function()
	-- Packer can manage itself as an optional plugin
	use {'wbthomason/packer.nvim', opt = true}

	-- Theme
	-- use { 'catppuccin/nvim', as = 'catppuccin' }
	use { 'tanvirtin/monokai.nvim' }

	-- LSP and completion
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	}

	-- treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
	}
	use { 'nvim-treesitter/nvim-treesitter-context' }

	-- Lua development
	use { 'tjdevries/nlua.nvim' }

	-- fuzzy search 
	use { 'ibhagwan/fzf-lua',
		-- optional for icon support
		requires = {
			{ 'junegunn/fzf', run = './install --bin' },
			{ 'nvim-tree/nvim-web-devicons' }
		}
	}

	-- jump to marked files
	use {
		'ThePrimeagen/harpoon',
		requires = {
			{'nvim-lua/plenary.nvim'}
		}
	}

	-- movements/mapping for surrounding tokens
	use { 'tpope/vim-surround' }
	use { 'unblevable/quick-scope' }

	-- code comments
	use { 'tpope/vim-commentary' }
	use { 'kkoomen/vim-doge',
		run = ':call doge#install()'
	}

	-- unit tests
	use { 'vim-test/vim-test' }

	-- pretty lists
	use {
		'folke/trouble.nvim',
		requires = 'nvim-tree/nvim-web-devicons',
		config = function()
			require('trouble').setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}

	-- mercurial
	use { 'ludovicchabant/vim-lawrencium' }

	-- git
	use { 'tpope/vim-fugitive' }

	-- session management
	use { 'tpope/vim-obsession' }

	-- whereami
	use { '~/Code/private/nvim-whereami' }

	-- elixir tools
	use { "elixir-tools/elixir-tools.nvim", tag = "stable", requires = { "nvim-lua/plenary.nvim" } }
end)
