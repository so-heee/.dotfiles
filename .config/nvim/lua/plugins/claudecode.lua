local toggle_key = '<leader>a'
return {
  {
    'coder/claudecode.nvim',
    dependencies = { 'folke/snacks.nvim' },
    config = true,
    opts = {
      terminal = {
        ---@module "snacks"
        ---@type snacks.win.Config|{}
        snacks_win_opts = {
          position = 'float',
          width = 0.99,
          height = 0.99,
          keys = {
            claude_hide = {
              toggle_key,
              function(self)
                self:hide()
              end,
              mode = 't',
              desc = 'Hide',
            },
          },
        },
      },
    },
  },
}
