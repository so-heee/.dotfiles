return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    -- インストールするパーサ（markdown_inline は injection 用でファイルタイプ無し）
    local parsers = {
      'toml',
      'json',
      'yaml',
      'go',
      'vim',
      'lua',
      'markdown',
      'markdown_inline',
      'typescript',
      'tsx',
      'javascript',
      'python',
      'terraform',
      'hcl',
      'bash',
      'sql',
      'css',
      'html',
    }
    require('nvim-treesitter').install(parsers)

    -- ハイライトは FileType autocmd で明示的に有効化（main ブランチ仕様）
    local filetypes = {
      'toml',
      'json',
      'yaml',
      'go',
      'vim',
      'lua',
      'markdown',
      'typescript',
      'typescriptreact',
      'javascript',
      'javascriptreact',
      'python',
      'terraform',
      'terraform-vars',
      'hcl',
      'sh',
      'bash',
      'sql',
      'css',
      'html',
    }
    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('TreesitterStart', { clear = true }),
      pattern = filetypes,
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
