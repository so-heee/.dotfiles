local status, lsp = pcall(require, "lsp-zero")
if not status then
	return
end

lsp.preset("recommended")

lsp.ensure_installed({
	"gopls",
	"sumneko_lua",
})
lsp.set_preferences({
	sign_icons = {},
})

lsp.on_attach(function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	local keymap = vim.keymap

	-- set keybinds
  keymap.set('n', 'gf', '<cmd>Lspsaga lsp_finder<CR>', opts)
  keymap.set('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', opts)
  keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
  keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opts)
  keymap.set('n', '<leader>d', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
  keymap.set('n', '<leader>d', '<cmd>Lspsaga show_cursor_diagnostics<CR>', opts)
  keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
  keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
  keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
  keymap.set('n', '<leader>o', '<cmd>LSoutlineToggle<CR>', opts)
end)

lsp.setup()
