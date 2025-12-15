return {
  {
    'daltonmenezes/aura-theme',
    rtp = 'packages/neovim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.rtp:append(vim.fn.stdpath('data') .. '/lazy/aura-theme/packages/neovim')
    end,
  },
}
