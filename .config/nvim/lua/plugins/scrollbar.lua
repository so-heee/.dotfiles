local scrollbar_status_ok, scrollbar = pcall(require, 'scrollbar')
local search_status_ok, search = pcall(require, 'scrollbar.handlers.search')
if not search_status_ok and not scrollbar_status_ok then
  return
end
search.setup()
scrollbar.setup()
