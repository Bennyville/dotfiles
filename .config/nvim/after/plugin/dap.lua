local dap = require('dap')

dap.adapters.php = {
    type = 'executable',
    command = 'node',
    args = {"/Users/bpeckruhn/.local/share/nvim/mason/packages/php-debug-adapter/extension/out/phpDebug.js"},
}

dap.configurations.php = {
    {
        type = 'php',
        request = 'launch',
        name = 'Listen for xdebug',
        port = '9000',
        log = true,
        serverSourceRoot = '/srv/www/freya/',
        localSourceRoot = '/Users/bpeckruhn/Code/work/freya/',
    },
}

require("dapui").setup()
