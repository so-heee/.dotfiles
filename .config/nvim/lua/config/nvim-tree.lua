require('nvim-tree').setup { auto_close = true, view = { width = 40 } }

-- WhichKeyへ移行
-- local map = require('utils').map
--
-- map('n', '<leader>dd', '<cmd>NvimTreeToggle<cr>')
-- map('n', '<leader>df', '<cmd>NvimTreeFocus<cr>')

local g = vim.g

g.nvim_tree_quit_on_open = 1
