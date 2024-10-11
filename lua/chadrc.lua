-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",
  transparency = true,
  theme_toggle = { "catppuccin", "ayu_light" },
  -- theme = "onedark",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.ui = {
  nvdash = {
    load_on_startup = true,

    header = {
      "██████╗░███████╗██████╗░████████╗",
      "██╔══██╗██╔════╝██╔══██╗╚══██╔══╝",
      "██████╦╝█████╗░░██████╔╝░░░██║░░░",
      "██╔══██╗██╔══╝░░██╔══██╗░░░██║░░░",
      "██████╦╝███████╗██║░░██║░░░██║░░░",
      "╚═════╝╚══════╝╚══╝╚═══╝░░░░░░░░░",
    },
  },
}
return M
