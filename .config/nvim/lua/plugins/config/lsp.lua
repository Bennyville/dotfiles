-- Set up Mason
require('mason').setup()

-- Set up Mason LSPconfig
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
		['<C-p>']     = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
		['<S-Tab>']     = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
		['<C-n>']     = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		['<Tab>']     = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		['<CR>']     = cmp.mapping.confirm({ select = true }),
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

-- Set up lspconfig.
local lspconfig = require('lspconfig')

-- Enable LSP capabilities.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Common on_attach function to map keys after the language server attaches to the current buffer.
local on_attach = function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

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

-- Use mason-lspconfig to setup language servers
require('mason-lspconfig').setup_handlers({
	-- Default handler (optional)
	function(server_name)
		lspconfig[server_name].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end,
	-- Specific configurations for certain servers
	['lua_ls'] = function()
		lspconfig.lua_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
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
	end,
	['rust_analyzer'] = function()
		lspconfig.rust_analyzer.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				['rust-analyzer'] = {
					checkOnSave = {
						command = 'clippy',
					},
				},
			},
		})
	end,
	['emmet_ls'] = function()
		lspconfig.emmet_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { 'html', 'css', 'elixir', 'eelixir', 'heex', 'blade', 'php' },
		})
	end,
	['cssls'] = function()
		lspconfig.cssls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { 'css', 'scss', 'less' },
		})
	end,
	['html'] = function()
		lspconfig.html.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { 'html', 'heex', 'blade', 'php' },
		})
	end,
})

-- Adjust 'iskeyword' setting for specific file types.
vim.cmd 'autocmd FileType php setlocal iskeyword+=$'
vim.cmd 'autocmd FileType javascript setlocal iskeyword+=$'

-- Optional: Automatically format on save.
-- vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.format({ async = false })'

