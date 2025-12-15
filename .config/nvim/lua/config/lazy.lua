-- local colorscheme = 'gruvbox'
local colorscheme = 'tokyonight'
-- local colorscheme = 'catppuccin'
-- local colorscheme = 'aura-theme'
-- local colorscheme = 'everforest'

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  spec = {
    { import = 'plugins.' .. colorscheme },
    { import = 'plugins.comment' },
    { import = 'plugins.colorizer' },
    { import = 'plugins.vim-highlightedyank' },
    { import = 'plugins.bufferline' },
    { import = 'plugins.autopairs' },
    { import = 'plugins.lualine' },
    { import = 'plugins.treesitter' },
    { import = 'plugins.neo-tree' },
    { import = 'plugins.telescope' },
    { import = 'plugins.hlchunk' },
    { import = 'plugins.scrollbar' },
    { import = 'plugins.markview' },
    { import = 'plugins.which-key' },
    { import = 'plugins.noice' },
    { import = 'plugins.gitsigns' },
    { import = 'plugins.lsp' },
    { import = 'plugins.diff' },
    { import = 'plugins.grug-far' },
    { import = 'plugins.claudecode' },

    -- { import = "plugins.smear-cursor" }, 動作が遅い
  },
  install = { colorscheme = { colorscheme } },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = { notify = false },
})

-- ============================
-- ★ 透明化を全テーマに適用
-- ============================
vim.api.nvim_create_autocmd('ColorScheme', {
  group = vim.api.nvim_create_augroup('ForceTransparentBG', { clear = true }),
  callback = function()
    -- 全体透明
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'none' })

    -- フロート
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })

    -- Telescope
    vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = 'none' })

    -- ★ Neo-tree（最も重要）
    vim.api.nvim_set_hl(0, 'NeoTreeNormal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NeoTreeNormalNC', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NeoTreeEndOfBuffer', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NeoTreeIndentMarker', { bg = 'none' })
  end,
})
vim.cmd.colorscheme(colorscheme)
