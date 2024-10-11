local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    json = { "prettier" },
    html = { "prettier" },
    cs = { "lsp" },
  },

  -- formatters = {
  --   csharpier = {
  --     command = "dotnet-csharpier",
  --     args = { "--write-stdout" },
  --   },
  -- },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
