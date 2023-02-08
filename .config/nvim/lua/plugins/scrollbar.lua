local scrollbar_status_ok, scrollbar = pcall(require, 'scrollbar')
if not scrollbar_status_ok then
  return
end
scrollbar.setup()
