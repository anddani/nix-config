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

config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.window_decorations = "NONE"
    
config.window_background_opacity = 0.95

config.window_padding = { bottom = 0 }

config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 2000 }

config.keys = {
    {
        mods = 'LEADER',
        key = 'c',
        action = wezterm.action.SpawnTab 'CurrentPaneDomain'
    },
    {
        mods = 'LEADER',
        key = 'x',
        action = wezterm.action.CloseCurrentPane { confirm = true }
    },
    {
        mods = 'LEADER',
        key = 'b',
        action = wezterm.action.ActivateLastTab
    },
    {
        mods = 'LEADER',
        key = 'p',
        action = wezterm.action.ActivateTabRelative(-1)
    },
    {
        mods = 'LEADER',
        key = 'n',
        action = wezterm.action.ActivateTabRelative(1)
    },
    {
        mods = 'LEADER',
        key = '\\',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
    },
    {
        mods = 'LEADER',
        key = '-',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
    },
    {
        mods = 'LEADER',
        key = 'h',
        action = wezterm.action.ActivatePaneDirection 'Left'
    },
    {
        mods = 'LEADER',
        key = 'j',
        action = wezterm.action.ActivatePaneDirection 'Down'
    },
    {
        mods = 'LEADER',
        key = 'k',
        action = wezterm.action.ActivatePaneDirection 'Up'
    },
    {
        mods = 'LEADER',
        key = 'l',
        action = wezterm.action.ActivatePaneDirection 'Right'
    },
    {
        mods = 'LEADER',
        key = 'LeftArrow',
        action = wezterm.action.AdjustPaneSize { 'Left', 5 }
    },
    {
        mods = 'LEADER',
        key = 'DownArrow',
        action = wezterm.action.AdjustPaneSize { 'Down', 5 }
    },
    {
        mods = 'LEADER',
        key = 'UpArrow',
        action = wezterm.action.AdjustPaneSize { 'Up', 5 }
    },
    {
        mods = 'LEADER',
        key = 'RightArrow',
        action = wezterm.action.AdjustPaneSize { 'Right', 5 }
    },
    {
        mods = 'LEADER',
        key = 's',
        action = wezterm.action.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' }
    },
    {
        mods = 'CTRL',
        key = 'q',
        action = wezterm.action.ToggleFullScreen,
    },
    {
        mods = 'CTRL',
        key = '\'',
        action = wezterm.action.ClearScrollback 'ScrollbackAndViewport',
    },
}

for i = 0, 9 do
    table.insert(config.keys, {
        key = tostring(i),
        mods = 'LEADER',
        action = wezterm.action.ActivateTab(i),
    })
end

config.mouse_bindings = {
    -- Ctrl-click will open the link under the mouse cursor
    {
        event = { Up = { streak = 1, button = 'Left' } },
        mods = 'CTRL',
        action = wezterm.action.OpenLinkAtMouseCursor,
    },
}

wezterm.on('update-status', function(window, _)
    local solid_left_arrow = ''
    local arrow_foreground = { Foreground = { Color = colors.arrow_foreground_leader } }
    local arrow_background = { Background = { Color = colors.arrow_background_leader } }
    local prefix = ''

    
    if window:leader_is_active() then
        prefix = ' ' .. leader_prefix
        if tab_stype == 'rounded' then
            solid_left_arrow = wezterm.nerdfonts.ple_right_half_circle_thick
        else
            solid_left_arrow = wezterm.nerdfonts.pl_left_hard_divider
        end

        local tabs = window:mux_window():tabs_with_info()

        if tab_style ~= 'rounded' then
            for _, tab_info in ipairs(tabs) do
                if tab_info.is_active and tab_info.index == 0 then
                    arrow_background = { Foreground = { Color = colors.tab_bar_active_tab_fg } }
                    solid_left_arrow = wezterm.nerdfonts.pl_right_hard_divider
                    break
                end
            end
        end
    end

    window:set_left_status(wezterm.format {
        { Background = { Color = colors.arrow_foreground_leader } },
        { Text = prefix },
        arrow_foreground,
        arrow_background,
        { Text = solid_left_arrow }
    })
end)

return config
