local wezterm = require("wezterm")
local action = wezterm.action

local M = {}

M.keys = {
  { key = "Escape", mods = "LEADER", action = action.ActivateCopyMode },
}

return M
