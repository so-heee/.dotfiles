local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

telescope.setup {
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
}

require('telescope').load_extension 'fzf'

-- WhichKeyへ移行
-- local map = require("utils").map
--
-- map('n', '<leader>f', '<cmd>Telescope find_files<cr>')
-- map('n', '<leader>g', '<cmd>Telescope live_grep<cr>')
-- map('n', '<leader>b', '<cmd>Telescope buffers<cr>')
