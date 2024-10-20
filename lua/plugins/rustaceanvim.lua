return {
  "mrcjkb/rustaceanvim",
  -- server = {
  --   -- on_attach = function(_, bufnr)
  --   --   -- local bufopts = { noremap = true, silent = true, buffer = bufnr }
  --   --   -- vim.keymap.set("n", "<F5>", require("dap").continue, bufopts)
  --   --   -- vim.keymap.set("n", "<F10>", require("dap").step_over, bufopts)
  --   --   -- vim.keymap.set("n", "<F11>", require("dap").step_into, bufopts)
  --   --   -- vim.keymap.set("n", "<F12>", require("dap").step_out, bufopts)
  --   --   -- vim.keymap.set("n", "<leader><leader>b", require("dap").toggle_breakpoint, bufopts)
  --   --   -- vim.keymap.set("n", "<leader>cR", function()
  --   --   --   vim.cmd.RustLsp "codeAction"
  --   --   -- end, { desc = "Code Action", buffer = bufnr })
  --   --   -- vim.keymap.set("n", "<leader>dr", function()
  --   --   --   vim.cmd.RustLsp "debuggables"
  --   --   -- end, { desc = "Rust Debuggables", buffer = bufnr })
  --   -- end,
  -- },
  version = "^5", -- Recommended
  lazy = false, -- This plugin is already lazy
  ["rust-analyzer"] = {
    cargo = {
      allFeatures = true,
    },
  },
}
