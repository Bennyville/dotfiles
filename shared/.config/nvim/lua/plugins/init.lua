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
		branch = 'main',
		config = function()
			require('plugins.config.treesitter')
		end
	},
	{ 'nvim-treesitter/nvim-treesitter-context' },
	-- { 'nvim-treesitter/playground' },

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
	},
	{
		"ThePrimeagen/99",
		config = function()
			local _99 = require("99")

            -- For logging that is to a file if you wish to trace through requests
            -- for reporting bugs, i would not rely on this, but instead the provided
            -- logging mechanisms within 99.  This is for more debugging purposes
            local cwd = vim.uv.cwd()
            local basename = vim.fs.basename(cwd)
			_99.setup({
                -- provider = _99.Providers.ClaudeCodeProvider,  -- default: OpenCodeProvider
				logger = {
					level = _99.DEBUG,
					path = "/tmp/" .. basename .. ".99.debug",
					print_on_error = true,
				},
                -- When setting this to something that is not inside the CWD tools
                -- such as claude code or opencode will have permission issues
                -- and generation will fail refer to tool documentation to resolve
                -- https://opencode.ai/docs/permissions/#external-directories
                -- https://code.claude.com/docs/en/permissions#read-and-edit
                tmp_dir = "./tmp",

                --- Completions: #rules and @files in the prompt buffer
                completion = {
                    -- I am going to disable these until i understand the
                    -- problem better.  Inside of cursor rules there is also
                    -- application rules, which means i need to apply these
                    -- differently
                    -- cursor_rules = "<custom path to cursor rules>"

                    --- A list of folders where you have your own SKILL.md
                    --- Expected format:
                    --- /path/to/dir/<skill_name>/SKILL.md
                    ---
                    --- Example:
                    --- Input Path:
                    --- "scratch/custom_rules/"
                    ---
                    --- Output Rules:
                    --- {path = "scratch/custom_rules/vim/SKILL.md", name = "vim"},
                    --- ... the other rules in that dir ...
                    ---
                    custom_rules = {
                      "scratch/custom_rules/",
                    },

                    --- Configure @file completion (all fields optional, sensible defaults)
                    files = {
                        -- enabled = true,
                        -- max_file_size = 102400,     -- bytes, skip files larger than this
                        -- max_files = 5000,            -- cap on total discovered files
                        -- exclude = { ".env", ".env.*", "node_modules", ".git", ... },
                    },
                    --- File Discovery:
                    --- - In git repos: Uses `git ls-files` which automatically respects .gitignore
                    --- - Non-git repos: Falls back to filesystem scanning with manual excludes
                    --- - Both methods apply the configured `exclude` list on top of gitignore

                    --- What autocomplete engine to use. Defaults to native (built-in) if not specified.
                    source = "native", -- "native" (default), "cmp", or "blink"
                },

                --- WARNING: if you change cwd then this is likely broken
                --- ill likely fix this in a later change
                ---
                --- md_files is a list of files to look for and auto add based on the location
                --- of the originating request.  That means if you are at /foo/bar/baz.lua
                --- the system will automagically look for:
                --- /foo/bar/AGENT.md
                --- /foo/AGENT.md
                --- assuming that /foo is project root (based on cwd)
				md_files = {
					"AGENT.md",
				},
			})

            -- take extra note that i have visual selection only in v mode
            -- technically whatever your last visual selection is, will be used
            -- so i have this set to visual mode so i dont screw up and use an
            -- old visual selection
            --
            -- likely ill add a mode check and assert on required visual mode
            -- so just prepare for it now
			vim.keymap.set("v", "<leader>9v", function()
				_99.visual()
			end)

            --- if you have a request you dont want to make any changes, just cancel it
			vim.keymap.set("n", "<leader>9x", function()
				_99.stop_all_requests()
			end)

			vim.keymap.set("n", "<leader>9s", function()
				_99.search()
			end)
		end,
	},
	{
		'dmtrKovalenko/fff.nvim',
		build = function()
			-- this will download prebuild binary or try to use existing rustup toolchain to build from source
			-- (if you are using lazy you can use gb for rebuilding a plugin if needed)
			require("fff.download").download_or_build_binary()
		end,
		-- if you are using nixos
		-- build = "nix run .#release",
		opts = { -- (optional)
			debug = {
				enabled = true,     -- we expect your collaboration at least during the beta
				show_scores = true, -- to help us optimize the scoring system, feel free to share your scores!
			},
		},
		-- No need to lazy-load with lazy.nvim.
		-- This plugin initializes itself lazily.
		lazy = false,
		keys = {
			{
				"<leader>ff", -- try it if you didn't it is a banger keybinding for a picker
				function() require('fff').find_files() end,
				desc = 'FFFind files',
			},
			-- {
			-- 	"fg",
			-- 	function() require('fff').live_grep() end,
			-- 	desc = 'LiFFFe grep',
			-- },
			{
				"<leader>fg",
				function() require('fff').live_grep({
					grep = {
						modes = { 'fuzzy', 'plain' }
					}
				}) end,
				desc = 'Live fffuzy grep',
			},
			{
				"<leader>fG",
				function() require('fff').live_grep({ query = vim.fn.expand("<cword>") }) end,
				desc = 'Search current word',
			},
		}
	}
}
