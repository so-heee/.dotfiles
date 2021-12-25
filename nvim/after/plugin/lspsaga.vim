UsePlugin 'lspsaga.nvim'

lua << EOF
local saga = require 'lspsaga'

saga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  infor_sign = '',
  border_style = "round",
}

EOF

" LspSagaFinder
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
" Code action
nnoremap <silent> <leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent> <leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
" Hover doc
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
" Signature help
nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
" Rename
nnoremap <silent> gn <cmd>lua require('lspsaga.rename').rename()<CR>
" Preview definition
nnoremap <silent> gD <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
" Diagnostic
nnoremap <silent> <leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
nnoremap <silent> <leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>
" Jump diagnostic
nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
" Float terminal
nnoremap <silent> <leader>t <cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>
tnoremap <silent> <leader>t <C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>

