local wezterm = require("wezterm")

local config = {}

local act = wezterm.action

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
-- config.color_scheme = "GruvboxDark"
-- config.color_scheme = "Panda (Gogh)"
-- config.color_scheme = "Aura (Gogh)"
-- config.color_scheme = "tokyonight_day"
config.color_scheme = "Tokyo Night (Gogh)"
-- config.color_scheme = "Catppuccin Mocha (Gogh)"
-- config.color_scheme = "Catppuccin Latte (Gogh)"
-- config.color_scheme = "OneDark (base16)"
-- config.color_scheme = "Solarized Dark (Gogh)"
-- config.color_scheme = "Everforest Dark (Gogh)"

-- 背景透過
config.window_background_opacity = 0.9
-- フォントの設定
config.font = wezterm.font("Moralerspace Argon", { weight = "Medium", stretch = "Normal", style = "Normal" })
-- フォントサイズの設定
config.font_size = 17
-- スクロールバック行数（デフォルト3500）
config.scrollback_lines = 7000
-- ベル無効
config.audible_bell = "Disabled"
-- imeでの入力を無効化
config.use_ime = true
-- 余白
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- タブバー
-- config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
wezterm.on('format-tab-title', function(tab)
  local idx = tostring(tab.tab_index + 1)
  return { { Text = '  ' .. idx .. '  ' } }
end)

-- config.term = "tmux-256color"
-- config.default_cursor_style = "BlinkingBlock"
-- config.cursor_thickness = 1.5
-- config.cursor_blink_rate = 500
-- config.cursor_blink_ease_in = "Constant"
-- config.cursor_blink_ease_out = "Constant"
config.colors = {
    cursor_bg = "gray",
}
-- config.force_reverse_video_cursor = false

config.leader = { key = "w", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
  -- ── ペイン操作 ──────────────────────
  { key = "-", mods = "LEADER", action = act.SplitVertical { domain = "CurrentPaneDomain" } },
  { key = "\\", mods = "LEADER", action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },

  { key = "h", mods = "LEADER", action = act.ActivatePaneDirection "Left" },
  { key = "j", mods = "LEADER", action = act.ActivatePaneDirection "Down" },
  { key = "k", mods = "LEADER", action = act.ActivatePaneDirection "Up" },
  { key = "l", mods = "LEADER", action = act.ActivatePaneDirection "Right" },

  -- ペインサイズ変更（Shift + hjkl）
  { key = "H", mods = "LEADER|SHIFT", action = act.AdjustPaneSize { "Left", 5 } },
  { key = "J", mods = "LEADER|SHIFT", action = act.AdjustPaneSize { "Down", 5 } },
  { key = "K", mods = "LEADER|SHIFT", action = act.AdjustPaneSize { "Up", 5 } },
  { key = "L", mods = "LEADER|SHIFT", action = act.AdjustPaneSize { "Right", 5 } },

  -- ── タブ操作 ─────────────────────────
  { key = "c", mods = "LEADER", action = act.SpawnTab "CurrentPaneDomain" },
  { key = "x", mods = "LEADER", action = act.CloseCurrentPane { confirm = true } },
  { key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
  { key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },

  -- ── その他 ─────────────────────────
  { key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
  { key = "r", mods = "LEADER", action = act.ReloadConfiguration },
  { key = "q", mods = "LEADER", action = act.PaneSelect { mode = "Activate" } },
}

return config
