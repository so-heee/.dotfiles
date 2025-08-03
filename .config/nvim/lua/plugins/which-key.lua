return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {},
	config = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files", mode = "n" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep", mode = "n" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers", mode = "n" },
			{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "ファイルエクスプローラー", mode = "n" },
			-- { "<leader>h", "<cmd>BufferLineCyclePrev<CR>", desc = "ファイルエクスプローラー", mode = "n" },
			-- { "<leader>l", "<cmd>BufferLineCycleNext<CR>", desc = "ファイルエクスプローラー", mode = "n" },
			{ "<leader>m", "<cmd>Markview splitToggle<CR>", desc = "Markview", mode = "n" },

			--LSP
			{
				"gd",
				"<cmd>lua vim.lsp.buf.definition()<CR>",
				desc = "Go to definition",
				mode = "n",
			},
			{
				"gD",
				"<cmd>lua vim.lsp.buf.declaration()<CR>",
				desc = "Go to declaration",
				mode = "n",
			},
			{
				"gi",
				"<cmd>lua vim.lsp.buf.implementation()<CR>",
				desc = "Go to implementation",
				mode = "n",
			},
			{
				"gr",
				"<cmd>lua vim.lsp.buf.references()<CR>",
				desc = "Go to references",
				mode = "n",
			},
			{
				"K",
				"<cmd>lua vim.lsp.buf.hover()<CR>",
				desc = "Show hover",
				mode = "n",
			},
			{
				"<leader>rn",
				"<cmd>lua vim.lsp.buf.rename()<CR>",
				desc = "Rename symbol",
				mode = "n",
			},
			{
				"<leader>ca",
				"<cmd>lua vim.lsp.buf.code_action()<CR>",
				desc = "Code actions",
				mode = "n",
			},
			{
				"K",
				"<cmd>lua vim.lsp.buf.hover()<CR>",
				desc = "ファイルエクスプローラー",
				mode = "n",
			},
		})
	end,
}

-- require('which-key').setup()
--
-- local mappings = {
--   -- q = { ':q<cr>', 'Quit' },
--   -- Q = { ':q!<cr>', 'Forced Quit' },
--   -- w = { ':w<cr>', 'Save' },
--   -- x = { ':bdelete<cr>', 'Close' },
--   t = {
--     name = 'ToggleTerm',
--     g = { '<cmd>lua _LAZYGIT_TOGGLE()<cr>', ' Lazygit' },
--     h = { '<cmd>ToggleTerm size=15 direction=horizontal<cr>', ' Horizontal' },
--     t = { '<cmd>ToggleTerm direction=float<cr>', ' Float' },
--   },
--   -- e = { '<cmd>NvimTreeToggle<cr>', 'NvimTree' },
--   e = { '<cmd>NeoTreeFocusToggle<cr>', 'NeoTree' },
--   f = {
--     name = 'Telescope',
--     f = { '<cmd>Telescope find_files<cr>', 'Find Files' },
--     g = { '<cmd>Telescope live_grep<cr>', 'Grep' },
--     o = { '<cmd>Telescope oldfiles<cr>', 'Old' },
--   },
--   g = {
--     name = 'Git',
--     g = { '<cmd>lua _LAZYGIT_TOGGLE()<CR>', 'Lazygit' },
--     j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", 'Next Hunk' },
--     k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", 'Prev Hunk' },
--     l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", 'Blame' },
--     p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", 'Preview Hunk' },
--     r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", 'Reset Hunk' },
--     R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", 'Reset Buffer' },
--     s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", 'Stage Hunk' },
--     u = {
--       "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
--       'Undo Stage Hunk',
--     },
--     o = { '<cmd>Telescope git_status<cr>', 'Open changed file' },
--     b = { '<cmd>Telescope git_branches<cr>', 'Checkout branch' },
--     c = { '<cmd>Telescope git_commits<cr>', 'Checkout commit' },
--     d = {
--       '<cmd>Gitsigns diffthis HEAD<cr>',
--       'Diff',
--     },
--   },
--   l = {
--     name = 'Lsp',
--     w = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', 'Add Workspace Folder' },
--     W = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', 'Remove Workspace Folder' },
--     l = {
--       '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>',
--       'List Workspace Folders',
--     },
--     f = { '<cmd>lua vim.lsp.buf.declaration()<CR>', 'Go To Declaration' },
--     d = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'Go To Definition' },
--     i = { '<cmd>lua vim.lsp.buf.implementation()<CR>', 'Go To Implementation' },
--     t = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Type Definition' },
--     r = { '<cmd>Telescope lsp_references<CR>', 'References' },
--     h = { '<cmd>Lspsaga lsp_finder<cr>', 'Lspsaga Finder' },
--     R = { '<cmd>Lspsaga rename<cr>', 'Rename' },
--     a = { '<cmd>Lspsaga code_action<cr>', 'Code Action' },
--     D = { '<cmd>Lspsaga peek_type_definition<cr>', 'Preview Definition' },
--     K = { '<cmd>Lspsaga hover_doc<cr>', 'Hover Doc' },
--     s = { '<cmd>Lspsaga signature_help<cr>', 'Signature Help' },
--     X = { '<cmd>Lspsaga show_line_diagnostics<cr>', 'Show Line Diagnostics' },
--     n = { '<cmd>Lspsaga diagnostic_jump_next<cr>', 'Go To Next Diagnostic' },
--     N = { '<cmd>Lspsaga diagnostic_jump_prev<cr>', 'Go To Previous Diagnostic' },
--     x = { '<cmd>TroubleToggle<cr>', 'Trouble' },
--     g = { '<cmd>Telescope diagnostics<CR>', 'All Diagnostics' },
--   },
--   o = { '<cmd>SymbolsOutline<cr>', 'SymbolsOutline' },
--   s = { "<cmd>lua require 'spectre'.open()<cr>", 'SymbolsOutline' },
-- }
--
-- local opts = { prefix = '<leader>' }
--
-- require('which-key').register(mappings, opts)
