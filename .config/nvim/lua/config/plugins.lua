return require('packer').startup(function()
	-- Packer can manage itself as an optional plugin
	use {'wbthomason/packer.nvim', opt = true}

	-- Theme
	use {'joshdick/onedark.vim'}

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

	-- Lua development
	use { 'tjdevries/nlua.nvim' }

	-- file browser 
	-- use { 'scrooloose/nerdtree' }
	-- use { 'PhilRunninger/nerdtree-visual-selection' }
	-- use { 'PhilRunninger/nerdtree-buffer-ops' }

	-- dim inactive windows
	use { 'blueyed/vim-diminactive' }

	-- fuzzy search 
	use { 'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
	use { 'junegunn/fzf.vim' }

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
end)
