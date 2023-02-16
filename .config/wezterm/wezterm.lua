local wezterm = require("wezterm")

function scheme_for_appearance(appearance)
  if appearance:find("Dark") then
    return "nightfox"
  else
    return "dayfox"
  end
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

return {
  color_scheme_dirs = {
    "~/.local/share/nvim/lazy/nightfox.nvim/extra",
  },

  -- General
  window_close_confirmation = "NeverPrompt", -- don't ask when closing window/tab.

  -- see https://wezfurlong.org/wezterm/config/lua/config/term.html for prerequisites.
  term = "wezterm",

  -- Fonts
  font = wezterm.font("SF Mono", {
    weight = "Medium",
  }),
  font_size = 13,
  line_height = 1.1,

  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },

  -- Tabs
  use_fancy_tab_bar = true,
  tab_bar_at_bottom = true,
  hide_tab_bar_if_only_one_tab = true,
  show_tab_index_in_tab_bar = false,

  -- Colors
  color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
}
