return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'master',
  lazy = false,
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'toml',
      'json',
      'yaml',
      'go',
      'vim',
      'lua',
      'markdown',
      'markdown_inline',
    },
    highlight = { enable = true },
  },
  -- 別々で書かないとハイライトが効かなかった
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
  end,
}
