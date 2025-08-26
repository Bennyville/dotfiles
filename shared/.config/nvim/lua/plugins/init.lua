return {
	-- colorscheme
	-- {
	-- 	'ellisonleao/gruvbox.nvim',
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require('plugins.config.colorscheme')
	-- 	end,
	-- },
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			require("everforest").setup({
				-- Your config here
			})
		end,
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

	-- whereami/copy reference
	-- { dir = '~/Code/private/nvim-whereami' },
	-- { 'bennyville/nvim-whereami' }

	-- copilot
	{
		'github/copilot.vim',
		config = function()
			require('plugins.config.copilot')
		end
	},

	-- avante
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		version = false, -- Never set this value to "*"! Never!
		---@module 'avante'
		---@type avante.Config
		opts = {
			provider = "openrouter",
			providers = {
				openrouter = {
					__inherited_from = 'openai',
					endpoint = 'https://openrouter.ai/api/v1',
					api_key_name = 'OPENROUTER_API_KEY',
					model = 'anthropic/claude-sonnet-4',
				},
			},
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"hrsh7th/nvim-cmp",   -- autocompletion for avante commands and mentions
			"ibhagwan/fzf-lua",   -- for file_selector provider fzf
			"stevearc/dressing.nvim", -- for input provider dressing
			"folke/snacks.nvim",  -- for input provider snacks
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				'MeanderingProgrammer/render-markdown.nvim',
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
	{
		"danymat/neogen",
		config = function()
			require('plugins.config.neogen')
		end
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")

			dap.adapters.gdb = {
				type = "executable",
				command = "gdb",
				args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
			}

			dap.configurations.c = {
				{
					name = "Launch",
					type = "gdb",
					request = "launch",
					program = function()
						return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
					end,
					cwd = "${workspaceFolder}/src",
					stopAtBeginningOfMainSubprogram = true,
				},
				{
					name = "Select and attach to process",
					type = "gdb",
					request = "attach",
					program = function()
						return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
					end,
					pid = function()
						local name = vim.fn.input('Executable name (filter): ')
						return require("dap.utils").pick_process({ filter = name })
					end,
					cwd = '${workspaceFolder}'
				},
				{
					name = 'Attach to gdbserver :1234',
					type = 'gdb',
					request = 'attach',
					target = 'localhost:1234',
					program = function()
						return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
					end,
					cwd = '${workspaceFolder}'
				},
			}
		end
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio"
		}
	}
}
