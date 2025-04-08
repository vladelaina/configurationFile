local wezterm = require("wezterm")

-- 背景图片文件名
local BACKGROUND_IMAGE = "28.jpg"
-- WSL 的默认工作目录
local WSL_HOME = "/home/vladelaina/code/Catime/"

local config = {
  -- 字体大小
  font_size = 20,
  -- 使用 JetBrains Mono Nerd Font 字体
  font = wezterm.font("JetBrainsMono Nerd Font"),
  -- 窗口装饰，只保留调整大小功能
  window_decorations = "RESIZE",
  -- 使用 Catppuccin Mocha 配色方案
  color_scheme = "Catppuccin Mocha",
  -- 文本背景透明度
  text_background_opacity = 0.8,
  -- 窗口背景透明度
  window_background_opacity = 0.8,
  -- 禁用花哨的标签栏
  use_fancy_tab_bar = false,
  -- 自动重载配置
  automatically_reload_config = true,
  -- 只有一个标签时隐藏标签栏
  hide_tab_bar_if_only_one_tab = true,
  -- 不显示新建标签按钮
  show_new_tab_button_in_tab_bar = false,
  -- 更改字体大小时不自动调整窗口大小
  adjust_window_size_when_changing_font_size = false,
  -- 光标样式为闪烁的竖线
  default_cursor_style = "BlinkingBar",
  -- 关闭窗口时不显示确认提示
  window_close_confirmation = "NeverPrompt",
  -- 窗口内边距设置
  window_padding = {
    left = 35,
    right = 30,
    top = 20,
    bottom = 20,
  },
  -- 背景设置
  background = {
    {
      -- 背景图片设置
      source = {
        File = string.format("C:\\Users\\vladelaina\\.config\\wezterm\\images\\%s", BACKGROUND_IMAGE),
      },
      -- 背景图片的色调、饱和度和亮度调整
      hsb = {
        hue = 1.0,
        saturation = 1.00,
        brightness = 1,
      },
    },
    {
      -- 添加一个半透明的颜色层
      source = {
        Color = "#282c35",
      },
      width = "100%",
      height = "100%",
      opacity = 0.55,
    },
  },
  -- 默认启动 WSL 并切换到指定目录
  default_prog = { "wsl.exe", "--cd", WSL_HOME },
  -- 初始终端大小
  initial_rows = 30,
  initial_cols = 115,
  
  -- 快捷键配置
  -- 窗口管理：
  --   Leader+Q  - 退出应用程序
  --   Ctrl+N    - 新建窗口
  -- 标签页管理：
  --   Ctrl+T    - 新建标签页
  -- 面板管理：
  --   Alt+Shift+H  - 水平分割面板
  --   Alt+Shift+V  - 垂直分割面板
  --   Ctrl+Q       - 关闭当前面板
  -- 面板导航：
  --   Ctrl+h  - 切换到左侧面板
  --   Ctrl+l  - 切换到右侧面板
  --   Ctrl+k  - 切换到上方面板
  --   Ctrl+j  - 切换到下方面板
  keys = {
    { key = 'q',          mods = 'LEADER',     action = wezterm.action.QuitApplication },
    { key = 'h',          mods = 'ALT|SHIFT',  action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 'v',          mods = 'ALT|SHIFT',  action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = 'q',          mods = 'CTRL',       action = wezterm.action.CloseCurrentPane { confirm = false } },
    { key = 'h',          mods = 'CTRL',       action = wezterm.action.ActivatePaneDirection 'Left' },
    { key = 'l',          mods = 'CTRL',       action = wezterm.action.ActivatePaneDirection 'Right' },
    { key = 'k',          mods = 'CTRL',       action = wezterm.action.ActivatePaneDirection 'Up' },
    { key = 'j',          mods = 'CTRL',       action = wezterm.action.ActivatePaneDirection 'Down' },
    { key = 't',          mods = 'CTRL',       action = wezterm.action.SpawnTab 'DefaultDomain' },
    { key = 'n',          mods = 'CTRL',       action = wezterm.action.SpawnWindow },
  }
}

return config
