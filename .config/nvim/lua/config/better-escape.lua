local present, better_escape = pcall(require, 'better_escape')
if not present then
  return
end

better_escape.setup {
  mapping = { 'jj' },
  timeout = vim.o.timeoutlen,
  keys = '<ESC>',
}
