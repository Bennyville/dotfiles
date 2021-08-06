return require('packer').startup(function()
	-- Packer can manage itself as an optional plugin
	use {'wbthomason/packer.nvim', opt = true}

	-- Theme
	use { 'crusoexia/vim-monokai' }

	-- LSP and completion
	use { 'neovim/nvim-lspconfig' }
	use { 'nvim-lua/completion-nvim' }

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

	-- ctags generator
	use { 'ludovicchabant/vim-gutentags' }

	-- movements/mapping for surrounding tokens
	use { 'tpope/vim-surround' }

	-- code comments
	use { 'tpope/vim-commentary' }
	
	-- elixir
	-- use { 'elixir-editors/vim-elixir' }

	-- xml
	use { 'othree/xml.vim' }
end)
