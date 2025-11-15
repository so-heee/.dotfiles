local wezterm = require("wezterm")

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
-- config.color_scheme = "Gruvbox (Gogh)"
-- config.color_scheme = "GruvboxDarkHard"
-- config.color_scheme = "tokyonight_day"
config.color_scheme = "tokyonight"
-- config.color_scheme = "Catppuccin Mocha (Gogh)"
-- config.color_scheme = "Catppuccin Latte (Gogh)"
-- config.color_scheme = "OneDark (base16)"

-- 背景透過
config.window_background_opacity = 0.9
-- フォントの設定
config.font = wezterm.font("Moralerspace Neon", { weight = "Medium", stretch = "Normal", style = "Normal" })
-- フォントサイズの設定
config.font_size = 17
-- スクロールバック行数（デフォルト3500）
config.scrollback_lines = 7000
-- ベル無効
config.audible_bell = "Disabled"
-- imeでの入力を無効化
config.use_ime = true
-- タブバー無効
config.enable_tab_bar = false
-- 余白
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
