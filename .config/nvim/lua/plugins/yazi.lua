return {
  'mikavilpas/yazi.nvim',
  version = '*', -- use the latest stable version
  keys = {
    { '<leader>y', '<cmd>Yazi toggle<CR>', desc = 'Yazi' },
  },
  dependencies = {
    { 'nvim-lua/plenary.nvim', lazy = true },
  },
}
