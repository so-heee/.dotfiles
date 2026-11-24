return {
  {
    'sainnhe/everforest',
    lazy = false,
    priority = 1000,
    config = function()
      -- soft / medium / hard の切り替えはここで行う
      vim.g.everforest_background = 'soft'
      vim.o.background = 'dark'
    end,
  },
}
