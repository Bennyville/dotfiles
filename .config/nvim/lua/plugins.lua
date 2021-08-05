return require('packer').startup(function()
	-- Packer can manage itself as an optional plugin
	use {'wbthomason/packer.nvim', opt = true}

	-- Theme
	use { 'crusoexia/vim-monokai' }

	-- LSP and completion
	use { 'neovim/nvim-lspconfig' }
	use { 'nvim-lua/completion-nvim' }

	-- Lua development
	use { 'tjdevries/nlua.nvim' }

	-- file browser 
	use { 'scrooloose/nerdtree' }

	-- fuzzy search 
	use { 'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
	use { 'junegunn/fzf.vim' }

	-- ctags generator
	use { 'ludovicchabant/vim-gutentags' }
	
	-- elixir
	use { 'elixir-editors/vim-elixir' }
end)
