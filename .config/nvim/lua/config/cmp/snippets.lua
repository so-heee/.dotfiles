vim.cmd "imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'"
vim.cmd "smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'"

vim.g.vsnip_snippet_dir = '~/.config/nvim/vsnippets'
