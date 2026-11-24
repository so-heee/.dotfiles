return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require('lint')

    lint.linters_by_ft = {
      go = { 'golangcilint' },
      python = { 'ruff' },
    }

    local augroup = vim.api.nvim_create_augroup('NvimLint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost', 'InsertLeave' }, {
      group = augroup,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
