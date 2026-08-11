local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- WEZTERM_CONFIG_FILE で任意パスから読み込む場合、そのディレクトリは
-- 自動ではrequireの検索パスに入らないため明示的に追加する
package.path = wezterm.config_dir .. "/?.lua;" .. package.path

config.color_scheme = "iceberg-dark"
config.automatically_reload_config = true
config.use_ime = true

----------------------------------------------------
-- font
----------------------------------------------------
if wezterm.target_triple:find("windows") then
	config.font = wezterm.font_with_fallback({
		{ family = "Cascadia Mono", weight = "Bold" },
		{ family = "Noto Sans JP", weight = "Bold" },
	})
else
	config.font = wezterm.font_with_fallback({
		{ family = "Monaco", weight = "Bold" },
		{ family = "Hiragino Kaku Gothic ProN", weight = "Bold" },
	})
end
config.font_size = 12.5

----------------------------------------------------
-- background
----------------------------------------------------
-- macの壁紙に対するぼかし
-- window_background_imageで設定したweztermの壁紙に対しては効かない
-- config.macos_window_background_blur = 20
-- config.window_background_opacity = 0.5

config.window_background_image = "/Users/takahirosakaguchi/Pictures/orangestar_wallpaper.jpeg"
config.window_background_image_hsb = {
	brightness = 0.005,
	-- hue = 0.6,
	-- saturation = 0.5,
}

----------------------------------------------------
-- tab
----------------------------------------------------
config.use_fancy_tab_bar = false
-- タイトルバーを非表示
-- config.window_decorations = "RESIZE"
-- タブの追加ボタンを非表示
config.show_new_tab_button_in_tab_bar = false
-- config.tab_bar_at_bottom = true
-- config.tab_max_width = 100

-- tabline.wez
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup({
	options = {
		theme = "Gruvbox Dark (Gogh)",
		theme_overrides = {
			normal_mode = {
				a = { fg = "#282828", bg = "#D79921" },
				b = { fg = "#D79921", bg = "#282828" },
				c = { fg = "#A89984", bg = "#282828" },
			},
			copy_mode = {
				a = { fg = "#282828", bg = "#B16286" },
				b = { fg = "#B16286", bg = "#282828" },
				c = { fg = "#A89984", bg = "#282828" },
			},
			search_mode = {
				a = { fg = "#282828", bg = "#458588" },
				b = { fg = "#458588", bg = "#282828" },
				c = { fg = "#A89984", bg = "#282828" },
			},
			window_mode = {
				a = { fg = "#282828", bg = "#689D6A" },
				b = { fg = "#689D6A", bg = "#282828" },
				c = { fg = "#A89984", bg = "#282828" },
			},
			tab = {
				active = { fg = "#282828", bg = "#A89984" },
				inactive = { fg = "#A89984", bg = "#282828" },
			},
		},
		icons_enabled = true,
		tabs_enabled = true,
		section_separators = {
			left = wezterm.nerdfonts.ple_upper_left_triangle,
			right = wezterm.nerdfonts.ple_lower_right_triangle,
		},
		component_separators = {
			left = wezterm.nerdfonts.ple_forwardslash_separator,
			right = wezterm.nerdfonts.ple_forwardslash_separator,
		},
		tab_separators = {
			left = wezterm.nerdfonts.ple_upper_left_triangle,
			right = wezterm.nerdfonts.ple_lower_right_triangle,
		},
	},
	sections = {
		tabline_a = { "workspace" },
		tabline_b = { "mode" },
		tabline_c = {},
		tab_active = { "index", { "tab", padding = { left = 0, right = 1 } } },
		tab_inactive = { "index", { "tab", padding = { left = 0, right = 1 } } },
		tabline_x = { "domain" },
		tabline_y = { "ram", "cpu", "battery" },
		tabline_z = {
			{
				"datetime",
				style = "%Y/%m/%d %H:%M:%S",
			},
		},
	},
	extensions = {},
})

----------------------------------------------------
-- windows / WSL
----------------------------------------------------
if wezterm.target_triple:find("windows") then
	-- 自動生成される"WSL:Ubuntu-20.04"ドメインと名前が衝突すると
	-- default_cwdが無視されるため、別名にして明示的に使う
	config.wsl_domains = {
		{
			name = "WSL:Ubuntu-20.04-home",
			distribution = "Ubuntu-20.04",
			username = "takah",
			default_cwd = "/home/takah",
		},
	}
	-- 新規タブボタンを非表示にしているため、ダブルクリック等の
	-- DefaultDomain経由のタブ作成もWindowsローカルではなくWSL側にする
	config.default_domain = "WSL:Ubuntu-20.04-home"
end

----------------------------------------------------
-- keybinds
----------------------------------------------------
config.disable_default_key_bindings = true
config.keys = require("keybinds").keys
config.key_tables = require("keybinds").key_tables
config.leader = { key = "f", mods = "CTRL", timeout_milliseconds = 2000 }

return config
