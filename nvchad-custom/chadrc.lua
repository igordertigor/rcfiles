---@type ChadrcConfig 
local M = {}
M.ui = {
  theme = 'penumbra_light',
  theme_toggle = {"penumbra_dark", "penumbra_light"},
  hl_override = {
    Comment = {italic = true}
  },
  hl_add = {
    NvimTreeOpenedFolderName = { fg = "green", bold = true },
  }
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
