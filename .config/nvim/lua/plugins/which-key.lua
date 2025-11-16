return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {},
  config = function()
    local wk = require 'which-key'
    wk.add {
      -- ファイル操作・検索 (f グループ)
      { '<leader>f', group = 'Find/Files' },
      { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find files', mode = 'n' },
      { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Live grep', mode = 'n' },
      { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Find buffers', mode = 'n' },

      { '<leader>fh', '<cmd>GrugFar<cr>', desc = 'GrugFar', mode = 'n' },

      -- UI・エクスプローラー
      {
        '<leader>e',
        '<cmd>Neotree toggle<cr>',
        desc = 'ファイルエクスプローラー',
        mode = 'n',
      },
      { '<leader>m', '<cmd>Markview splitToggle<CR>', desc = 'Markview', mode = 'n' },

      -- LSP操作 (l グループ)
      { '<leader>l', group = 'LSP' },
      { '<leader>lr', '<cmd>Lspsaga rename<CR>', desc = 'リネーム', mode = 'n' },
      {
        '<leader>la',
        '<cmd>Lspsaga code_action<CR>',
        desc = 'コードアクション',
        mode = { 'n', 'v' },
      },
      { '<leader>lf', '<cmd>Lspsaga finder<CR>', desc = '参照・定義検索', mode = 'n' },
      { '<leader>lo', '<cmd>Lspsaga outline<CR>', desc = 'アウトライン', mode = 'n' },
      {
        '<leader>lF',
        '<cmd>lua vim.lsp.buf.format()<CR>',
        desc = 'フォーマット',
        mode = { 'n', 'v' },
      },

      -- 診断 (d グループ)
      { '<leader>d', group = 'Diagnostics' },
      { '<leader>dd', '<cmd>Trouble diagnostics toggle<CR>', desc = '診断一覧', mode = 'n' },
      {
        '<leader>df',
        '<cmd>Trouble diagnostics toggle filter.buf=0<CR>',
        desc = 'ファイル診断',
        mode = 'n',
      },
      { '<leader>dp', '<cmd>Lspsaga diagnostic_jump_prev<CR>', desc = '前の診断', mode = 'n' },
      { '<leader>dn', '<cmd>Lspsaga diagnostic_jump_next<CR>', desc = '次の診断', mode = 'n' },
      {
        '<leader>ds',
        '<cmd>Lspsaga show_line_diagnostics<CR>',
        desc = '行診断表示',
        mode = 'n',
      },

      -- LSPナビゲーション（グループ化しない - 頻繁に使用）
      { 'gd', '<cmd>Lspsaga goto_definition<CR>', desc = '定義へ移動', mode = 'n' },
      { 'gp', '<cmd>Lspsaga peek_definition<CR>', desc = '定義プレビュー', mode = 'n' },
      { 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', desc = '宣言へ移動', mode = 'n' },
      { 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', desc = '実装へ移動', mode = 'n' },
      { 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', desc = '参照を表示', mode = 'n' },
      {
        'gt',
        '<cmd>Lspsaga peek_type_definition<CR>',
        desc = '型定義プレビュー',
        mode = 'n',
      },
      { 'gk', '<cmd>Lspsaga hover_doc<CR>', desc = 'ホバー情報', mode = 'n' },
      { 'gs', '<cmd>Lspsaga signature_help<CR>', desc = 'シグネチャヘルプ', mode = 'n' },
    }
  end,
}
