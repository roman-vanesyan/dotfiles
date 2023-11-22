local wezterm = require("wezterm")

function scheme_for_appearance(appearance)
  return "duskfox"
end

-- Automatically reload the schema based on OS appearance settings.
wezterm.on("window-config-reloaded", function(window, pane)
  local overrides = window:get_config_overrides() or {}
  local appearance = window:get_appearance()
  local scheme = scheme_for_appearance(appearance)
  if overrides.color_scheme ~= scheme then
    overrides.color_scheme = scheme
    window:set_config_overrides(overrides)
  end
end)

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme_dirs = {
  "~/.local/share/nvim/lazy/nightfox.nvim/extra",
}

-- General
config.window_close_confirmation = "NeverPrompt" -- don't ask when closing window/tab.

-- see https://wezfurlong.org/wezterm/config/lua/config/term.html for prerequisites.
config.term = "wezterm"
config.native_macos_fullscreen_mode = true -- Use native fullscreen mode on macOs.

-- Fonts
config.font = wezterm.font("SF Mono", {
  weight = "Medium",
})
config.font_size = 15
config.line_height = 1.1

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- Tabs
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.show_tab_index_in_tab_bar = false

-- Colors
config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

return config
