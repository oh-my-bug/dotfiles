local wezterm = require('wezterm')
local mux = wezterm.mux
local config = wezterm.config_builder()

--- Fix issue with stop taking input after holding any key for some time
config.use_ime = false

--- Font settings
config.font_size = 16
config.line_height = 1.2
config.font = wezterm.font("MesloLGS Nerd Font")

--- Colors
config.colors = {
  cursor_bg = "white",
  cursor_border = "white",
}

-- Appearance
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.8
config.macos_window_background_blur = 20

wezterm.on('gui-startup', function(cmd)
  local active_screen = wezterm.gui.screens()["active"]
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():set_position(14, 84)
  window:gui_window():set_inner_size(active_screen.width - 30, active_screen.height - 100)
end)

-- Other
config.max_fps = 120
config.prefer_egl = true

return config
