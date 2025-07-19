return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			component_separators = "",
			section_separators = "",
		},
		sections = {
			lualine_a = {
				{
					"mode",
					padding = 2,
				},
			},
			lualine_b = {
				{
					"branch",
					padding = 2,
				},
				{
					"diff",
					symbols = { added = " ", modified = " ", removed = " " },
					padding = 2,
				},
			},
			lualine_c = {
				{
					"diagnostics",
					sources = { "nvim_diagnostic" },
					symbols = { error = " ", warn = " ", info = " " },
					padding = 2,
				},
			},
			lualine_x = {
				{
					"filename",
					newfile_status = true,
					path = 3,
					symbols = {
						modified = "",
						readonly = "[Readonly]",
					},
				},
				{
					"filetype",
				},
			},
			lualine_y = { "encoding", "fileformat" },
			lualine_z = {
				"selectioncount",
				"location",
				"progress",
			},
		},
	},
}
