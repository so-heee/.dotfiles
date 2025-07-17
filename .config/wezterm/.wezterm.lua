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
-- Tokyo Night
-- Catppuccin Macchiato (Gogh)
config.color_scheme = 'Tokyo Night'

-- 背景透過
config.window_background_opacity = 0.9

-- フォントの設定
config.font = wezterm.font("HackGen35 Console NF", { weight = "Medium", stretch = "Normal", style = "Normal" })

-- フォントサイズの設定
config.font_size = 17


return config
