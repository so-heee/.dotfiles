local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

telescope.setup {
  extensions = {
    media_files = {
      filetypes = { 'png', 'webp', 'jpg', 'jpeg' },
      -- find_cmd = 'rg', -- find command (defaults to `fd`)
    },
    file_browser = {
      mappings = {
        ['i'] = {
          -- your custom insert mode mappings
        },
        ['n'] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}

telescope.load_extension 'media_files'
telescope.load_extension 'file_browser'

-- WhichKeyへ移行
-- local map = require("utils").map
--
-- map('n', '<leader>f', '<cmd>Telescope find_files<cr>')
-- map('n', '<leader>g', '<cmd>Telescope live_grep<cr>')
-- map('n', '<leader>b', '<cmd>Telescope buffers<cr>')
