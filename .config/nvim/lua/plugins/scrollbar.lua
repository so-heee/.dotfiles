return {
    'petertriho/nvim-scrollbar',
    config = function()
      local colors_status_ok, colors = pcall(require, 'tokyonight.colors')
      if colors_status_ok then
        require("scrollbar").setup({
          handle = {
            color = colors.bg_highlight,
          },
          marks = {
            Search = { color = colors.orange },
            Error = { color = colors.error },
            Warn = { color = colors.warning },
            Info = { color = colors.info },
            Hint = { color = colors.hint },
            Misc = { color = colors.purple },
          },
        })
      else
        require("scrollbar").setup()
      end
    end,
}
