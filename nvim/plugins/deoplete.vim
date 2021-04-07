"----------------------------------------
" Shougo/deoplete.nvim
"----------------------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"