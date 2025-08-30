local dap = require("dap")
local dapui = require("dapui")
dapui.setup();


-- Start/Continue
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP: Continue/Start" })

-- Step controls
vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "DAP: Step Over" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "DAP: Step Into" })
vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "DAP: Step Out" })

-- Breakpoints
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dB", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "DAP: Conditional Breakpoint" })
vim.keymap.set("n", "<leader>dl", function()
  dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, { desc = "DAP: Log Point" })

-- REPL & Run
vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "DAP: Open REPL" })
vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "DAP: Run Last" })

-- UI controls
vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "DAP: Toggle UI" })
vim.keymap.set({ "n", "v" }, "<leader>de", dapui.eval, { desc = "DAP: Eval" })


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
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
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
