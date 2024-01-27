local wezterm = require("wezterm")

local M = {}

-- Theme
M.color_scheme_dirs = {
  "~/.local/share/nvim/lazy/nightfox.nvim/extra",
}
M.color_scheme = "duskfox"

-- Fonts
M.font = wezterm.font("SF Mono", {
  weight = "Medium",
})
M.font_size = 15
M.line_height = 1.1

-- Window
M.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- Tabs
M.use_fancy_tab_bar = true
M.tab_bar_at_bottom = true
M.hide_tab_bar_if_only_one_tab = true
M.show_tab_index_in_tab_bar = false

return M
