return require('packer').startup(function()
	-- Packer can manage itself as an optional plugin
	use {'wbthomason/packer.nvim', opt = true}

	-- Theme
	use { 'joshdick/onedark.vim' }
	-- use { 'crusoexia/vim-monokai' }

	-- LSP and completion
	use { 'neovim/nvim-lspconfig' }
	-- use { 'nvim-lua/completion-nvim' }
	use { 'hrsh7th/cmp-nvim-lsp' }
	use { 'hrsh7th/cmp-buffer' }
	use { 'hrsh7th/nvim-cmp' }
	use { 'hrsh7th/cmp-vsnip' }
	use { 'hrsh7th/vim-vsnip' }

	-- treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
	} 

	-- Lua development
	use { 'tjdevries/nlua.nvim' }

	-- file browser 
	use { 'scrooloose/nerdtree' }
	use { 'PhilRunninger/nerdtree-visual-selection' }
	use { 'PhilRunninger/nerdtree-buffer-ops' }

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
