-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

if not vim.g.vscode then
  require("lazy").setup({
    spec = {
      -- ColorScheme
      { import = "plugins.tokyonight" },
      -- { import = "plugins.catppuccin" },

      { import = "plugins.vim-highlightedyank" },
      { import = "plugins.comment" },
      { import = "plugins.bufferline" },
      { import = "plugins.autopairs" },
      { import = "plugins.lualine" },
      { import = "plugins.treesitter" },
      { import = "plugins.neo-tree" },
      { import = "plugins.telescope" },
      { import = "plugins.hlchunk" },
      -- { import = "plugins.smear-cursor" }, 動作が遅い
      { import = "plugins.scrollbar" },
      { import = "plugins.markdown-preview" },
    },
    install = { colorscheme = { "tokyonight" } },
    checker = { enabled = true },
    change_detection = { notify = false },
  })
end

-- require('lazy').setup {
  -- {
  -- 'nvim-lua/popup.nvim',
  --   cond = isVscode(),
  -- },
  -- -- キーマップのポップアップ
  -- {
  --   'folke/which-key.nvim',
  --   config = function()
  --     require 'plugins.whichkey'
  --   end,
  --   cond = isVscode(),
  -- },

  -- -- LSP
  -- {
  --   'VonHeikemen/lsp-zero.nvim',
  --   dependencies = {
  --     -- LSP Support
  --     { 'neovim/nvim-lspconfig' }, -- Required
  --     { 'williamboman/mason.nvim' }, -- Optional
  --     { 'williamboman/mason-lspconfig.nvim' }, -- Optional
  --     { 'SmiteshP/nvim-navic' },
  --     { 'ray-x/lsp_signature.nvim' },
  --     { 'glepnir/lspsaga.nvim' },
  --     { 'folke/lsp-colors.nvim' },
  --     { 'folke/trouble.nvim' },

  --     -- Formmater
  --     { 'jose-elias-alvarez/null-ls.nvim' },
  --     { 'jay-babu/mason-null-ls.nvim' },

  --     -- Autocompletion
  --     { 'hrsh7th/nvim-cmp' }, -- Required
  --     { 'hrsh7th/cmp-nvim-lsp' }, -- Required
  --     { 'hrsh7th/cmp-buffer' }, -- Optional
  --     { 'hrsh7th/cmp-path' }, -- Optional
  --     { 'hrsh7th/cmp-cmdline' },
  --     { 'saadparwaiz1/cmp_luasnip' }, -- Optional
  --     { 'hrsh7th/cmp-nvim-lua' }, -- Optional
  --     { 'onsails/lspkind-nvim' },

  --     -- Snippets
  --     { 'L3MON4D3/LuaSnip' }, -- Required
  --     { 'rafamadriz/friendly-snippets' }, -- Optional
  --   },
  --   config = function()
  --     require 'plugins.lsp'
  --   end,
  --   cond = isVscode(),
  -- },
--}


