local status_ok, tree = pcall(require, 'nvim-tree')
if not status_ok then
  return
end

tree.setup {
  view = { width = 40 },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
}

-- WhichKeyへ移行
-- local map = require('utils').map
--
-- map('n', '<leader>dd', '<cmd>NvimTreeToggle<cr>')
-- map('n', '<leader>df', '<cmd>NvimTreeFocus<cr>')
