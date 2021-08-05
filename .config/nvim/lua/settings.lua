local lspconfig = require("lspconfig")
local completion = require("completion")

local path_to_elixirls = vim.fn.expand("~/.config/nvim/lspconfig/elixirls/language_server.sh")

lspconfig.elixirls.setup{
	cmd = {path_to_elixirls},
	on_attach = completion.on_attach,
	settings = {
		elixirLS = {
			-- I also choose to turn off the auto dep fetching feature.
			-- It often get's into a weird state that requires deleting
			-- the .elixir_ls directory and restarting your editor.
			fetchDeps = false
		}
	}
}

