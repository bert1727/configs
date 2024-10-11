-- load defaults i.e lua_lsplsplsplsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLElsp
local servers = { "html", "cssls", "ts_ls", "tailwindcss", "pylsp", "clangd" }
local nvlsp = require "nvchad.configs.lspconfig"

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    update_in_insert = true,
    commands = {
      OrganizeImports = {
        organize_imports,
        description = "Organize Imports",
      },
    },
  }
end

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
lspconfig.omnisharp.setup {
  cmd = { "dotnet", "/home/bert/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll" },
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  update_in_insert = true,
  handlers = {
    ["textDocument/definition"] = function(...)
      return require("omnisharp_extended").handler(...)
    end,
    ["textDocument/typeDefinition"] = function(...)
      return require("omnisharp_extended").handler(...)
    end,
    ["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
      if not result then
        return
      end
      -- Фильтрация диагностик, исключение предупреждения CS0219
      local filtered_diagnostics = vim.tbl_filter(function(diagnostic)
        return diagnostic.code ~= "CS0219" and diagnostic.code ~= "IDE0161" -- Замените на нужный код
      end, result.diagnostics)
      result.diagnostics = filtered_diagnostics
      vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
    end,
  },
  keys = {
    {
      {
        "gd",
        function()
          require("omnisharp_extended").telescope_lsp_definitions()
        end,
        desc = "Goto Definition",
      },
      {
        "<leader>D",
        function()
          require("omnisharp_extended").telescope_lsp_type_definitions()
        end,
        desc = "Go to Type Definition",
      },
    },
  },
  enable_roslyn_analyzers = true,
  organize_imports_on_format = true,
  enable_import_completion = true,
  -- enable_editorconfig_support = true,
}

-- lspconfig.rust_analyzer.setup {
--   on_attach = function(_, bufnr)
--     -- Кастомные ключи для Rust
--     local function buf_set_keymap(...)
--       vim.api.nvim_buf_set_keymap(bufnr, ...)
--     end
--     local opts = { noremap = true, silent = true }
--
--     buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
--     buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
--     buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
--
--     buf_set_keymap("n", "<leader>a", "<cmd>RustLsp codeAction<CR>", opts)
--     -- buf_set_keymap("n", "<leader>a", "<cmd>lua vim.cmd.RustLsp codeAction { silent = true, buffer = bufnr }<CR>", opts)
--     -- supports rust-analyzer's grouping
--     -- or vim.lsp.buf.codeAction() if you don't want grouping.
--
--     -- Другие ключевые команды LSP
--   end,
--
--   settings = {
--     ["rust-analyzer"] = {
--       cargo = {
--         allFeatures = true,
--       },
--       checkOnSave = {
--         command = "clippy",
--       },
--     },
--   },
-- }

-- lspconfig.rustaceanvim.setup {
-- }
-- lspconfig.tsserver.setup {
--   on_attach = function(client)
--     -- Отключаем встроенное форматирование tsserver, если используется другой форматтер
--     client.server_capabilities.document_formatting = false
--   end,
--   settings = {
--     javascript = {
--       format = {
--         enable = false, -- Отключить встроенный форматтер
--       },
--     },
--     typescript = {
--       format = {
--         enable = false, -- Отключить встроенный форматтер
--       },
--     },
--   },
-- }

vim.diagnostic.config {
  virtual_text = false,
}

vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
