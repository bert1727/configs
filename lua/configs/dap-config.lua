local dap = require "dap"
local dapui = require "dapui"

-- Configure codelldb adapter for Rust
-- ~/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb
-- /home/bert/.local/share/nvim/mason/packages/codelldb
-- ~/.local/share/nvim/mason/bin/codelldb
dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = "/home/bert/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb", -- Update this to the path of your codelldb executable
    args = { "--port", "${port}" },
  },
}

dap.configurations.rust = {
  {
    name = "Launch",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
}

vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP Continue" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP Step Over" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP Step Into" })
vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP Step Out" })
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
vim.keymap.set("n", "<leader>B", function()
  dap.set_breakpoint(vim.fn.input "Breakpoint condition: ")
end, { desc = "DAP Set Breakpoint with condition" })

-- DAP UI setup
dapui.setup()

-- Open DAP UI automatically
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
