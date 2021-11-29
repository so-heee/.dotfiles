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

nnoremap <silent> <S-j> <Cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent>K <Cmd>Lspsaga hover_doc<CR>
inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>
nnoremap <leader>rn <cmd>Lspsaga rename<CR>
nnoremap <silent><leader>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>
