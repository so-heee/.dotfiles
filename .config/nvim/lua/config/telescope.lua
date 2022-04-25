local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

telescope.setup {}

-- WhichKeyへ移行
-- local map = require("utils").map
--
-- map('n', '<leader>f', '<cmd>Telescope find_files<cr>')
-- map('n', '<leader>g', '<cmd>Telescope live_grep<cr>')
-- map('n', '<leader>b', '<cmd>Telescope buffers<cr>')
