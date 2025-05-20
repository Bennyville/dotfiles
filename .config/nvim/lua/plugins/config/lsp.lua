-- Common on_attach function to map keys after the language server attaches to the current buffer.
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
	local opts = { buffer = ev.buf }

	vim.keymap.set('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	vim.keymap.set('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	vim.keymap.set('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	vim.keymap.set('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	vim.keymap.set('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
	vim.keymap.set('n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	vim.keymap.set('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
	vim.keymap.set('n', '<leader>e', '<Cmd>lua vim.diagnostic.open_float()<CR>', opts)
	vim.keymap.set('n', '[d', '<Cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
	vim.keymap.set('n', ']d', '<Cmd>lua vim.diagnostic.goto_next()<CR>', opts)
	vim.keymap.set('n', '<leader>f', '<Cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)
  end
})

-- Add the same capabilities to ALL server configurations.
-- Refer to :h vim.lsp.config() for more information.
vim.lsp.config("*", {
	capabilities = vim.lsp.protocol.make_client_capabilities()
})
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
})
vim.lsp.config("rust_analyzer", {
	settings = {
		['rust-analyzer'] = {
			checkOnSave = {
				command = 'clippy',
			},
		},
	},
})
vim.lsp.config("emmet_ls", {
	filetypes = { 'html', 'css', 'elixir', 'eelixir', 'heex' },
})
vim.lsp.config("cssls", {
	filetypes = { 'css', 'scss', 'less' },
})
vim.lsp.config("html", {
	filetypes = { 'html', 'heex' },
})

require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = {
		'lua_ls',
		'emmet_ls',
		'html',
		'rust_analyzer',
		'cssls',
		'intelephense',
		'ts_ls',
	},
	automatic_installation = true,
})

-- Set up nvim-cmp.
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
	snippet = {
		expand = function(args)
			-- Use `luasnip` for snippet expansion.
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		['<S-Tab>']   = nil,
		['<Tab>']     = nil,
		['<C-p>']     = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
		['<C-n>']     = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		['<C-y>']     = cmp.mapping.confirm({ select = true }),
		['<C-Space>'] = cmp.mapping.complete(),
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' }, -- Add luasnip as a source
		{ name = 'buffer' },
		{ name = 'path' },
		-- Add additional sources if needed
	}),
})

-- Adjust 'iskeyword' setting for specific file types.
vim.cmd 'autocmd FileType php setlocal iskeyword+=$'
vim.cmd 'autocmd FileType javascript setlocal iskeyword+=$'

