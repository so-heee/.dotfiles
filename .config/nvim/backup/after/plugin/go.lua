local status_ok, go = pcall(require, "go")
if not status_ok then
  return
end

go.setup({
	comment_placeholder = ""
})

vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
