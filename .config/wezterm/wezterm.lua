local wezterm = require('wezterm')

function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'GitHub Dark'
  else
    -- TODO: set light theme. rn, font looks too thin when using builtin 'Github Light'. 
    return 'GitHub Dark'
  end
end

-- Automatically reload the schema based on OS appearance settings.
wezterm.on('window-config-reloaded', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  local appearance = window:get_appearance()
  local scheme = scheme_for_appearance(appearance)
  if overrides.color_scheme ~= scheme then
    overrides.color_scheme = scheme
    window:set_config_overrides(overrides)
  end
end)

return {
  -- General
  front_end = 'WebGpu', -- don't ask when closing window/tab.
  window_close_confirmation = 'NeverPrompt',

  -- Fonts
  font = wezterm.font('SF Mono'),
  font_size = 13,
  line_height = 1.1,

  -- Colors
  color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
}
