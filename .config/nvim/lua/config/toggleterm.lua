require('toggleterm').setup { open_mapping = [[<c-\>]], direction = 'float' }

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new { cmd = 'lazygit', hidden = true }

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end
