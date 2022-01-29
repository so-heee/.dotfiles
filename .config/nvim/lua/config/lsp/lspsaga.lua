require('lspsaga').init_lsp_saga({
  error_sign = '',
  warn_sign = '',
  infor_sign = '',
  border_style = "round",
})

local map = require("utils").map

-- LspSaga Finder
map("n", "gh", "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>")
-- Code Action
map("n", "<leader>ca", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>")
map("v", "<leader>ca", ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>")
-- Hover Doc
map("n", "K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>")
map("n", "<C-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
map("n", "<C-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")
-- Signature Help
map("n", "gs", "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>")
-- Rename
map("n", "gn", "<cmd>lua require('lspsaga.rename').rename()<CR>")
-- Preview Definition
map("n", "gD", "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>")
-- Diagnostic
map("n", "<leader>cd", "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>")
map("n", "<leader>cd", ":Lspsaga show_line_diagnostics<CR>")
map("n", "<leader>cc", "<cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>")
-- Jump Diagnostic
map("n", "[e", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>")
map("n", "]e", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>")
-- Float Terminal
map("n", "<leader>t", "<cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>")
map("t", "<leader>t", "<C-\\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>")
