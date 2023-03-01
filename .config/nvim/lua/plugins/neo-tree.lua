local status_ok, tree = pcall(require, 'neo-tree')
if not status_ok then
  return
end

tree.setup {}

-- WhichKeyへ移行
-- local map = require('utils').map
--
-- map('n', '<leader>dd', '<cmd>NvimTreeToggle<cr>')
-- map('n', '<leader>df', '<cmd>NvimTreeFocus<cr>')
