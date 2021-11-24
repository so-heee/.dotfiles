"----------------------------------------
" Shougo/deoplete.nvim
"----------------------------------------
UsePlugin 'deoplete.nvim'

let g:deoplete#enable_at_startup = 1
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"
