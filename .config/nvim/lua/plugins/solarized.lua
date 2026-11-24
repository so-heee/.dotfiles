return {
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- dark / light の切り替えはここで行う
      vim.o.background = 'dark'
      require('solarized').setup()
    end,
  },
}
