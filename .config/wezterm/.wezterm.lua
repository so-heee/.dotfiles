local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- 最初からフルスクリーンで起動
local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():toggle_fullscreen()
end)

-- カラースキームの設定
-- config.color_scheme = 'Tokyo Night Storm'
config.color_scheme = 'Tokyo Night'
-- config.color_scheme = 'Catppuccin Mocha (Gogh)'
-- config.color_scheme = 'Catppuccin Latte (Gogh)'

-- 背景透過
config.window_background_opacity = 0.9

-- フォントの設定
config.font = wezterm.font("HackGen35 Console NF", { weight = "Medium", stretch = "Normal", style = "Normal" })

-- フォントサイズの設定
config.font_size = 17


return config
