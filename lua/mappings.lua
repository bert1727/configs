require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")
map("i", "ол", "<ESC>")
map("n", "<leader>q", "<cmd>q<cr>")
map("i", "<C-g>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true })

map("i", "<C-ц>", "<C-w>")
map("n", "<S-l>", "<cmd>bnext<cr>")
map("n", "<S-h>", "<cmd>bprevious<cr>")
map("n", "<M-j>", "i<CR><ESC>")

local api = require "nvim-tree.api"
-- TODO перенести в отдельный файл
local function custom_on_attach(bufnr)
  api.config.mappings.default_on_attach(bufnr)
  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- Привязка клавиш только в буфере nvim-tree
  vim.keymap.set("n", "l", api.node.open.edit, opts "Open")
  vim.keymap.set("n", "h", api.node.navigate.parent_close, opts "Close Directory")

  -- Другие кастомные клавиши для nvim-tree
  vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts "Up")
  vim.keymap.set("n", "?", api.tree.toggle_help, opts "Help")
end

require("nvim-tree").setup {
  on_attach = custom_on_attach,
  -- view = {
  --   side = "right",
  -- },
}
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>-", require("oil").toggle_float, { desc = "Toggle oil" })

-- Настройка маппингов для Harpoon
vim.keymap.set("n", "<leader><leader>ha", function()
  require("harpoon.mark").add_file()
end, { desc = "Add file to Harpoon" }) -- Добавить файл в Harpoon
vim.keymap.set("n", "<leader>hh", function()
  require("harpoon.ui").toggle_quick_menu()
end, { desc = "Toggle Harpoon quick menu" }) -- Открыть меню Harpoon
vim.keymap.set("n", "<leader><leader>hn", function()
  require("harpoon.ui").nav_next()
end, { desc = "Navigate to next file" }) -- Переключение на следующий файл
vim.keymap.set("n", "<leader><leader>hp", function()
  require("harpoon.ui").nav_prev()
end, { desc = "Navigate to previous file" }) -- Переключение на предыдущий файл
vim.keymap.set("n", "<leader>1", function()
  require("harpoon.ui").nav_file(1)
end, { desc = "Navigate to file 1" }) -- Перейти к первому файлу
vim.keymap.set("n", "<leader>2", function()
  require("harpoon.ui").nav_file(2)
end, { desc = "Navigate to file 2" }) -- Перейти ко второму файлу
vim.keymap.set("n", "<leader>3", function()
  require("harpoon.ui").nav_file(3)
end, { desc = "Navigate to file 3" }) -- Перейти к третьему файлу
vim.keymap.set("n", "<leader>4", function()
  require("harpoon.ui").nav_file(4)
end, { desc = "Navigate to file 4" }) -- Перейти к четвертому файлу

-- Открыть диагностический список LSP и использовать Telescope для поиска
map("n", "<leader>ld", function()
  require("telescope.builtin").diagnostics {
    bufnr = 0, -- если хотите, чтобы поиск был только в текущем буфере
  }
end, { desc = "List diagnostics in Telescope" })

-- Использовать grep по диагностике LSP (grep_string)
map("n", "<leader>lg", function()
  require("telescope.builtin").diagnostics {}
end, { desc = "List diagnostics in Telescope for all buffers" })
