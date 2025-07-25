return {
	{
		"neovim/nvim-lspconfig",
	},
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			local mason_servers = {
				"gopls",
				"lua_ls",
			}
			require("mason-lspconfig").setup({
				ensure_installed = mason_servers,
				automatic_enable = true,
			})
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			local masonnullls_status_ok, masonnullls = pcall(require, "mason-null-ls")

			if not masonnullls_status_ok then
				return
			end

			masonnullls.setup({
				ensure_installed = {
					"stylua",
					"golangci_lint",
					"gofumpt",
					"goimports",
				},
				automatic_installation = true,
			})

			local status_ok, nullls = pcall(require, "null-ls")
			if not status_ok then
				return
			end

			local formatting = nullls.builtins.formatting
			local diagnostics = nullls.builtins.diagnostics
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			nullls.setup({
				sources = {
					formatting.stylua,
					formatting.goimports,
					diagnostics.golangci_lint,
				},
				-- configure on save
				on_attach = function(current_client, bufnr)
					if current_client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({
									filter = function(client)
										-- only format on save if the client supports formatting
										return client.name == "null-ls"
									end,
									bufnr = bufnr,
								})
							end,
						})
					end
				end,
			})
		end,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"saghen/blink.cmp",
		version = "1.*",
		event = { "InsertEnter", "CmdLineEnter" },
		opts = {
			keymap = { preset = "enter" },
			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
		},
		opts_extend = { "sources.default" },
	},
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
	},
}
