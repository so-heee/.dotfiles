return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'mason-org/mason.nvim' },
  opts = {
    ensure_installed = {
      'stylua',
      'gofumpt',
      'goimports',
      'sqlfmt',
      'golangci-lint',
      'prettierd',
      'ruff',
      'shfmt',
      'shellcheck',
    },
    run_on_start = true,
  },
}
