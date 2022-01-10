require('nvim-tree').setup {}

local map = require("utils").map

map('n', '<leader>dd', '<cmd>NvimTreeToggle<cr>')
map('n', '<leader>df', '<cmd>NvimTreeFocus<cr>')
