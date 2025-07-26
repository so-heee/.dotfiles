local colorscheme = "gruvbox"
-- colorscheme = "tokyonight"
-- colorscheme = "catppuccin"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "plugins." .. colorscheme },
		{ import = "plugins.comment" },
		{ import = "plugins.vim-highlightedyank" },
		{ import = "plugins.bufferline" },
		{ import = "plugins.autopairs" },
		{ import = "plugins.lualine" },
		{ import = "plugins.treesitter" },
		{ import = "plugins.neo-tree" },
		{ import = "plugins.telescope" },
		{ import = "plugins.hlchunk" },
		{ import = "plugins.scrollbar" },
		{ import = "plugins.markview" },
		{ import = "plugins.which-key" },
		{ import = "plugins.noice" },
		{ import = "plugins.gitsigns" },
		{ import = "plugins.lsp" },

		-- { import = "plugins.smear-cursor" }, 動作が遅い
	},
	install = { colorscheme = { colorscheme } },
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = { notify = false },
})
