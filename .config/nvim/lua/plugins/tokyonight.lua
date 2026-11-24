return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- light / dark の切り替えはここで行う ('day' が light, 'storm'/'night' が dark)
      require('tokyonight').setup({ style = 'storm' })
    end,
  },
}
