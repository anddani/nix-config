local wezterm = require 'wezterm'
return {
    adjust_window_size_when_changing_font_size = false,
    color_scheme = 'Catppuccin Frappe',
    font_size = 16.0,
    font = wezterm.font('FiraCode Nerd Font'),
    macos_window_background_blur = 30,

    cursor_blink_ease_in = 'Constant',
    cursor_blink_ease_out = 'Constant',

    enable_tab_bar = true,
    tab_bar_at_bottom = true,
    
    window_background_opacity = 0.85,
    window_decorations = 'RESIZE',
    keys = {
        {
            key = 'q',
            mods = 'CTRL',
            action = wezterm.action.ToggleFullScreen,
        },
        {
            key = '\'',
            mods = 'CTRL',
            action = wezterm.action.ClearScrollback 'ScrollbackAndViewport',
        },
    },
    mouse_bindings = {
        -- Ctrl-click will open the link under the mouse cursor
        {
            event = { Up = { streak = 1, button = 'Left' } },
            mods = 'CTRL',
            action = wezterm.action.OpenLinkAtMouseCursor,
        },
    },
}
