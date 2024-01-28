local wezterm = require("wezterm")
local action = wezterm.action

local M = {}

M.keys = {
  { key = "Escape", mods = "LEADER", action = action.ActivateCopyMode },

  -- Move cursor forward/backward by word
  {
    key = "LeftArrow",
    mods = "SHIFT",
    action = action.SendKey({ key = "b", mods = "ALT" }),
  },
  {
    key = "RightArrow",
    mods = "SHIFT",
    action = action.SendKey({ key = "f", mods = "ALT" }),
  },
}

return M
