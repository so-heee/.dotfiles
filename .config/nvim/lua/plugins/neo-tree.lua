local status_ok, tree = pcall(require, 'neo-tree')
if not status_ok then
  return
end

tree.setup {
  close_if_last_window = true,
  filesystem = {
    filtered_items = {
      visible = false, -- when true, they will just be displayed differently than normal items
      hide_dotfiles = false,
      hide_gitignored = false,
    },
  },
  event_handlers = {
    {
      event = 'file_opened',
      handler = function(file_path)
        --auto close
        require('neo-tree').close_all()
      end,
    },
  },
}

-- WhichKeyへ移行
-- local map = require('utils').map
--
-- map('n', '<leader>dd', '<cmd>NvimTreeToggle<cr>')
-- map('n', '<leader>df', '<cmd>NvimTreeFocus<cr>')
