local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup{
	direction = 'float'
}

local map = require("utils").map

map('n', '<leader>t', '<cmd>ToggleTerm<CR>')
map('t', '<leader>t', '<cmd>ToggleTerm<CR>')
