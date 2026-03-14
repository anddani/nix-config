local wezterm = require('wezterm')
local config = wezterm.config_builder()

config.color_scheme = 'Catppuccin Frappe'
local color_scheme = wezterm.color.get_builtin_schemes()[config.color_scheme]
local accent = "#babbf1"

local leader_prefix = utf8.char(0x1f30a)

config.adjust_window_size_when_changing_font_size = false
config.font_size = 14.0
config.font = wezterm.font('FiraCode Nerd Font')
config.macos_window_background_blur = 30

config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'

config.enable_tab_bar = false
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false

if wezterm.target_triple == 'aarch64-apple-darwin' then
 config.window_decorations = "RESIZE"
else
 config.window_decorations = "NONE"
end
    
config.window_background_opacity = 0.95

config.window_padding = { bottom = 0 }

config.mouse_bindings = {
    -- Ctrl-click will open the link under the mouse cursor
    {
        event = { Up = { streak = 1, button = 'Left' } },
        mods = 'CTRL',
        action = wezterm.action.OpenLinkAtMouseCursor,
    },
}

return config
