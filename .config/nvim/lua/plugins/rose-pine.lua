return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    config = function()
      -- light / dark の切り替えはここで行う (dawn = light variant)
      require('rose-pine').setup({ variant = 'dawn' })
      vim.o.background = 'light'
    end,
  },
}
