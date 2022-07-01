require('go').setup {
  comment_placeholder = '',
}

vim.api.nvim_exec(
  [[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]],
  false
)
