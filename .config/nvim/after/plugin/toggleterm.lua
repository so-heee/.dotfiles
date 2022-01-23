local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then return end

toggleterm.setup {direction = 'float'}

-- WhichKeyへ移行
local map = require("utils").map
map('n', '<leader>t', '<cmd>ToggleTerm<CR>')
map('t', '<leader>t', '<cmd>ToggleTerm<CR>')

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({cmd = "lazygit", hidden = true})

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end
