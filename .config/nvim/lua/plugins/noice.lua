return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {},
	dependencies = {
		{ "MunifTanjim/nui.nvim" },
		{
			"rcarriga/nvim-notify",
			opts = {
				stages = "fade",
				render = "compact",
				background_colour = "#000000",
			},
		},
	},
}
