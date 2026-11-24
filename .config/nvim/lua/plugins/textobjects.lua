return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  branch = 'main',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('nvim-treesitter-textobjects').setup({
      select = {
        lookahead = true,
      },
      move = {
        set_jumps = true,
      },
    })

    local select = require('nvim-treesitter-textobjects.select')
    local move = require('nvim-treesitter-textobjects.move')
    local swap = require('nvim-treesitter-textobjects.swap')

    -- 選択 (select)
    local selections = {
      ['af'] = { '@function.outer', '関数全体' },
      ['if'] = { '@function.inner', '関数の内側' },
      ['ac'] = { '@class.outer', 'クラス全体' },
      ['ic'] = { '@class.inner', 'クラスの内側' },
      ['aa'] = { '@parameter.outer', '引数全体' },
      ['ia'] = { '@parameter.inner', '引数の内側' },
    }
    for key, spec in pairs(selections) do
      vim.keymap.set({ 'x', 'o' }, key, function()
        select.select_textobject(spec[1], 'textobjects')
      end, { silent = true, desc = '選択: ' .. spec[2] })
    end

    -- 移動 (move)
    vim.keymap.set({ 'n', 'x', 'o' }, ']f', function()
      move.goto_next_start('@function.outer', 'textobjects')
    end, { silent = true, desc = '次の関数へ' })
    vim.keymap.set({ 'n', 'x', 'o' }, '[f', function()
      move.goto_previous_start('@function.outer', 'textobjects')
    end, { silent = true, desc = '前の関数へ' })
    vim.keymap.set({ 'n', 'x', 'o' }, ']c', function()
      move.goto_next_start('@class.outer', 'textobjects')
    end, { silent = true, desc = '次のクラスへ' })
    vim.keymap.set({ 'n', 'x', 'o' }, '[c', function()
      move.goto_previous_start('@class.outer', 'textobjects')
    end, { silent = true, desc = '前のクラスへ' })

    -- 入れ替え (swap)
    vim.keymap.set('n', '<leader>sa', function()
      swap.swap_next('@parameter.inner')
    end, { silent = true, desc = '次の引数と入れ替え' })
    vim.keymap.set('n', '<leader>sA', function()
      swap.swap_previous('@parameter.inner')
    end, { silent = true, desc = '前の引数と入れ替え' })
  end,
}
