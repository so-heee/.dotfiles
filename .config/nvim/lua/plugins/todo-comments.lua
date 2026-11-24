return {
  'folke/todo-comments.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {},
  keys = {
    { '<leader>ft', '<cmd>TodoTelescope<cr>', desc = 'Todo (Telescope)' },
    {
      ']t',
      function()
        require('todo-comments').jump_next()
      end,
      desc = '次の TODO へ',
    },
    {
      '[t',
      function()
        require('todo-comments').jump_prev()
      end,
      desc = '前の TODO へ',
    },
  },
}
