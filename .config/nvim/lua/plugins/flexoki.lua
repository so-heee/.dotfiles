return {
  {
    'kepano/flexoki-neovim',
    name = 'flexoki',
    lazy = false,
    priority = 1000,
    config = function()
      -- light / dark の切り替えはここで行う ('flexoki' は background に追従)
      vim.o.background = 'light'
    end,
  },
}
