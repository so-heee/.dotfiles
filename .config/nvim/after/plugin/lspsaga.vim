UsePlugin 'lspsaga.nvim'

lua << EOF
local lspsaga = require 'lspsaga'
lspsaga.setup {
  debug = false,
  use_saga_diagnostic_sign = true,
  -- diagnostic sign
  error_sign = "",
  warn_sign = "",
  hint_sign = "",
  infor_sign = "",
  diagnostic_header_icon = "   ",
  -- code action title icon
  code_action_icon = " ",
  code_action_prompt = {enable = true, sign = true, sign_priority = 40, virtual_text = true},
  finder_definition_icon = "  ",
  finder_reference_icon = "  ",
  max_preview_lines = 10,
  finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>"
  },
  code_action_keys = {quit = "q", exec = "<CR>"},
  rename_action_keys = {quit = "<C-c>", exec = "<CR>"},
  definition_preview_icon = "  ",
  border_style = "single",
  rename_prompt_prefix = "➤",
  server_filetype_map = {},
  diagnostic_prefix_format = "%d. "
}
EOF

" WhichKeyに移行
" LspSagaFinder
" nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
" Code action
" nnoremap <silent> <leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
" vnoremap <silent> <leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
" Hover doc
" nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
" nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
" Signature help
" nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
" Rename
" nnoremap <silent> gn <cmd>lua require('lspsaga.rename').rename()<CR>
" Preview definition
" nnoremap <silent> gD <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
" Diagnostic
" nnoremap <silent> <leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
" nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
" nnoremap <silent> <leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>
" Jump diagnostic
" nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
" nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
" Float terminal
" nnoremap <silent> <leader>t <cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>
" tnoremap <silent> <leader>t <C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>

