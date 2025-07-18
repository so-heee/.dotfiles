return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = false,
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      'toml',
      'json',
      'yaml',
      'go',
      'vim',
      'lua',
      "markdown",
      "markdown_inline",
    },
  },
}
