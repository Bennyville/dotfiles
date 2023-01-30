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

	-- coc
	-- use {
	-- 	'neoclide/coc.nvim',
	-- 	branch = 'release'
	-- }

	-- -- coc extensions
	-- use {
	-- 	'neoclide/coc-phpls',
	-- 	run = 'yarn install --frozen-lockfile'
	-- }
	-- use {
	-- 	'neoclide/coc-html',
	-- 	run = 'yarn install --frozen-lockfile'
	-- }
	-- use {
	-- 	'neoclide/coc-css',
	-- 	run = 'yarn install --frozen-lockfile'
	-- }
	-- use {
	-- 	'neoclide/coc-tsserver',
	-- 	run = 'yarn install --frozen-lockfile'
	-- }

	-- treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
	} 

	-- Lua development
	use { 'tjdevries/nlua.nvim' }

	-- file browser 
	use { 'scrooloose/nerdtree' }

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

	-- syntax
	use { 'sheerun/vim-polyglot' }
	
	-- elixir
	-- use { 'elixir-editors/vim-elixir' }

	-- xml
	-- use { 'othree/xml.vim' }
	
	-- mercurial
	use { 'ludovicchabant/vim-lawrencium' }

	-- session management
	use { 'tpope/vim-obsession' }

	-- Filetype icons
	use { 'ryanoasis/vim-devicons' }
end)
