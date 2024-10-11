require "nvchad.options"

-- add yours here!

local o = vim.o
-- o.cursorlineopt = "both" -- to enable cursorline!
-- o.cursorline = true
o.relativenumber = true
o.ignorecase = true
o.smartcase = true
o.incsearch = true
o.scrolloff = 7
o.smarttab = true
vim.lsp.inlay_hint.enable(true, { 0 })

--
o.langmap =
  "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

-- local nvlsp = require "nvchad.configs.lspconfig"
vim.g.rustaceanvim = {
  -- Plugin configuration
  tools = {},
  -- LSP configuration
  server = {
    on_attach = function(client, bufnr)
      -- vim.keymap.set("n", "<leader>a", function()
      --   vim.cmd.RustLsp "codeAction" -- supports rust-analyzer's grouping
      --   -- or vim.lsp.buf.codeAction() if you don't want grouping.
      -- end, { silent = true, buffer = bufnr })

      local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
      end
      local opts = { noremap = true, silent = true }

      buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
      buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
      buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

      buf_set_keymap("n", "<leader>a", "<cmd>RustLsp codeAction<CR>", opts)
      -- local function buf_set_keymap(...)
      --   vim.api.nvim_buf_set_keymap(bufnr, ...)
      -- end
      -- local opts = { noremap = true, silent = true }
      --
      -- -- Пример дефолтных LSP клавиш
      -- buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts) -- Переход к определению
      -- buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts) -- Всплывающее окно документации
      -- buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- Переход к реализации
      -- buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts) -- Подпись функции
      -- buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts) -- Переименование
      --
      -- buf_set_keymap("n", "<leader>a", function()
      --   vim.cmd.RustLsp "codeAction" -- supports rust-analyzer's grouping
      --   -- or vim.lsp.buf.codeAction() if you don't want grouping.
      -- end, { silent = true, buffer = bufnr })
      --
      -- -- Специфичные для rustaceanvim команды
      -- buf_set_keymap("n", "<leader>rr", "<cmd>RustRun<CR>", opts) -- Запуск программы
      -- buf_set_keymap("n", "<leader>rt", "<cmd>RustTest<CR>", opts) -- Тестирование
      -- buf_set_keymap("n", "<leader>rd", "<cmd>RustDebuggables<CR>", opts) -- Доступные для дебага функции
      -- you can also put keymaps in here
    end,
    default_settings = {
      -- rust-analyzer language server configuration
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
        },
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
  -- DAP configuration
  dap = {},
}
