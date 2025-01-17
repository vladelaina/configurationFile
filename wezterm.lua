local wezterm = require("wezterm")
local config = {
    font_size = 20,
    font = wezterm.font("Fira Code"), 
    window_decorations = "RESIZE",
    color_scheme = "Catppuccin Mocha",
    text_background_opacity = 0.8,
    window_background_opacity = 0.8,
    use_fancy_tab_bar = false,
    automatically_reload_config = true,
    hide_tab_bar_if_only_one_tab = true,
    show_new_tab_button_in_tab_bar = false,
    adjust_window_size_when_changing_font_size = false,
    default_cursor_style = "BlinkingBar",
    window_close_confirmation = "NeverPrompt",
    window_padding = {
        left = 35,
        right = 30,
        top = 30,
        bottom = 20,
    },
    background = {
        {
            source = {
                File = "C:\\Users\\vladelaina\\.config\\wezterm\\1.jpg",
            },
            hsb = {
                hue = 1.0,
                saturation = 1.00,
                brightness = 1,
            },
        },
        {
            source = {
                Color = "#282c35",
            },
            width = "100%",
            height = "100%",
            opacity = 0.55,
        },
    },
    default_prog = { "wsl.exe", "--cd", "/home/vladelaina" },
    initial_rows = 30,
    initial_cols = 115,
    keys = {
        { key = 'q', mods = 'LEADER', action = wezterm.action.QuitApplication },
        { key = 'h', mods = 'ALT|SHIFT', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
        { key = 'v', mods = 'ALT|SHIFT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
        { key = 'q', mods = 'CTRL', action = wezterm.action.CloseCurrentPane { confirm = false } },
        { key = 'LeftArrow', mods = 'SHIFT|CTRL', action = wezterm.action.ActivatePaneDirection 'Left' },
        { key = 'RightArrow', mods = 'SHIFT|CTRL', action = wezterm.action.ActivatePaneDirection 'Right' },
        { key = 'UpArrow', mods = 'SHIFT|CTRL', action = wezterm.action.ActivatePaneDirection 'Up' },
        { key = 'DownArrow', mods = 'SHIFT|CTRL', action = wezterm.action.ActivatePaneDirection 'Down' },
        { key = 't', mods = 'CTRL', action = wezterm.action.SpawnTab 'DefaultDomain' },
        { key = 'w', mods = 'CTRL', action = wezterm.action.CloseCurrentTab { confirm = false } },
        { key = 'n', mods = 'CTRL', action = wezterm.action.SpawnWindow },
    }
}

return config
