local lspconfig = require'lspconfig'
local configs = require'lspconfig/configs'
local cmp = require'cmp'

cmp.setup({
	snippet = {
      expand = function(args)
        -- For `vsnip` user.
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
      end,
    },
	mapping = {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({ select = false }),
		['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' },
		{ name = 'buffer' },
	}
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

vim.cmd 'autocmd FileType php setlocal iskeyword+=$'
vim.cmd 'autocmd FileType javascript setlocal iskeyword+=$'

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local path_to_elixirls = vim.fn.expand("~/.config/nvim/lspconfig/elixirls/language_server.sh")

if not lspconfig.emmet_ls then    
  configs.emmet_ls = {    
    default_config = {    
      cmd = {'emmet-ls', '--stdio'};
      filetypes = {'html', 'css', 'php'};
      root_dir = function(fname)    
        return vim.loop.cwd()
      end;    
      settings = {};    
    };    
  }    
end    

local servers = {'cssls', 'tsserver', 'emmet_ls'}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities
	}
end

lspconfig.html.setup{
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = {"html", "xhtml", "php"}
}

lspconfig.elixirls.setup{
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = {path_to_elixirls},
	settings = {
		elixirLS = {
			-- I also choose to turn off the auto dep fetching feature.
			-- It often get's into a weird state that requires deleting
			-- the .elixir_ls directory and restarting your editor.
			fetchDeps = false
		}
	},
}

lspconfig.efm.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = {"elixir"}
})

lspconfig.intelephense.setup{
	 settings = {
        intelephense = {
            stubs = {
				"amqp",
				"apache",
				"apcu",
				"bcmath",
				"bz2",
				"calendar",
				"cassandra",
				"com_dotnet",
				"Core",
				"couchbase",
				"crypto",
				"ctype",
				"cubrid",
				"curl",
				"date",
				"dba",
				"dom",
				"enchant",
				"Ev",
				"event",
				"exif",
				"fann",
				"FFI",
				"ffmpeg",
				"fileinfo",
				"filter",
				"fpm",
				"ftp",
				"gd",
				"gearman",
				"geoip",
				"geos",
				"gettext",
				"gmagick",
				"gmp",
				"gnupg",
				"grpc",
				"hash",
				"http",
				"ibm_db2",
				"iconv",
				"igbinary",
				"imagick",
				"imap",
				"inotify",
				"interbase",
				"intl",
				"json",
				"judy",
				"ldap",
				"leveldb",
				"libevent",
				"libsodium",
				"libxml",
				"lua",
				"mailparse",
				"mapscript",
				"mbstring",
				"mcrypt",
				"memcache",
				"memcached",
				"meminfo",
				"meta",
				"ming",
				"mongo",
				"mongodb",
				"mqseries",
				"msgpack",
				"mssql",
				"mysql",
				"mysql_xdevapi",
				"mysqli",
				"ncurses",
				"newrelic",
				"oauth",
				"oci8",
				"odbc",
				"openssl",
				"parallel",
				"Parle",
				"pcntl",
				"pcov",
				"pcre",
				"pdflib",
				"PDO",
				"pdo_ibm",
				"pdo_mysql",
				"pdo_pgsql",
				"pdo_sqlite",
				"pgsql",
				"Phar",
				"posix",
				"pspell",
				"pthreads",
				"radius",
				"rar",
				"rdkafka",
				"readline",
				"recode",
				"redis",
				"Reflection",
				"regex",
				"rrd",
				"SaxonC",
				"session",
				"shmop",
				"SimpleXML",
				"snmp",
				"soap",
				"sockets",
				"sodium",
				"solr",
				"SPL",
				"SplType",
				"SQLite",
				"sqlite3",
				"sqlsrv",
				"ssh2",
				"standard",
				"stomp",
				"suhosin",
				"superglobals",
				"svn",
				"sybase",
				"sync",
				"sysvmsg",
				"sysvsem",
				"sysvshm",
				"tidy",
				"tokenizer",
				"uopz",
				"uv",
				"v8js",
				"wddx",
				"win32service",
				"winbinder",
				"wincache",
				"wordpress",
				"xcache",
				"xdebug",
				"xhprof",
				"xml",
				"xmlreader",
				"xmlrpc",
				"xmlwriter",
				"xsl",
				"xxtea",
				"yaf",
				"yaml",
				"yar",
				"zend",
				"Zend OPcache",
				"ZendCache",
				"ZendDebugger",
				"ZendUtils",
				"zip",
				"zlib",
				"zmq",
				"zookeeper"
			},
            files = {
                maxSize = 5000000;
            };
        };
    },
	capabilities = capabilities,
	on_attach = on_attach,
}

-- lspconfig.cssls.setup{
-- 	on_attach = on_attach,
-- 	capabilities = capabilities
-- }

-- lspconfig.html.setup{
-- 	on_attach = on_attach,
-- 	filetypes = { "html", "php" },
-- 	capabilities = capabilities
-- }

-- lspconfig.tsserver.setup{
-- 	on_attach = on_attach,
-- 	capabilities = capabilities
-- }

