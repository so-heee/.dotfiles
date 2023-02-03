local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  {
    'folke/tokyonight.nvim',
    config = function()
      vim.cmd [[colorscheme tokyonight]]
    end,
  },
  { 'machakann/vim-highlightedyank' },
  {
    'terryma/vim-expand-region',
    config = function()
      require 'plugins.vim-expand-region'
    end,
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },
  { 'nvim-lua/popup.nvim' },
  -- Bufferline
  {
    'akinsho/bufferline.nvim',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      require('bufferline').setup()
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
      'SmiteshP/nvim-navic',
    },
    config = function()
      require 'plugins.lualine'
    end,
  },
  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require 'plugins.treesitter'
    end,
  },
  --NvimTree
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require 'plugins.nvim-tree'
    end,
  },
  -- Telescope
  {
    'Usuim/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require 'plugins.telescope'
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require 'plugins.indentline'
    end,
  },

  -- Snippet collection
  { 'rafamadriz/friendly-snippets' },
  -- Snippet engine
  { 'L3MON4D3/LuaSnip' },
  -- Completion engine
  {
    'hrsh7th/nvim-cmp',
    config = function()
      require 'plugins.lsp.nvim-cmp'
    end,
  },
  -- Snippet completion source
  { 'saadparwaiz1/cmp_luasnip' },
  -- Buffer completion source
  { 'hrsh7th/cmp-buffer' },
  -- Path completion source
  { 'hrsh7th/cmp-path' },
  -- Commadline completion source
  { 'hrsh7th/cmp-cmdline' },
  -- LSP completion source
  { 'hrsh7th/cmp-nvim-lsp' },
  -- LSP Icons
  {
    'onsails/lspkind-nvim',
    config = function()
      require 'plugins.lsp.lspkind'
    end,
  },

  -- Built-in LSP
  {
    'neovim/nvim-lspconfig',
    config = function()
      require 'plugins.lsp.lspconfig'
    end,
  },
  -- Package Manager
  {
    'williamboman/mason.nvim',
    config = function()
      require 'plugins.lsp.mason'
    end,
  },
  -- LSP manager
  { 'williamboman/mason-lspconfig.nvim' },
  { 'SmiteshP/nvim-navic' },
  { 'ray-x/lsp_signature.nvim' },
  { 'glepnir/lspsaga.nvim' },
  { 'folke/lsp-colors.nvim' },
  -- Formatting and linting
  { 'jose-elias-alvarez/null-ls.nvim' },
  -- null-ls manager
  {
    'jayp0521/mason-null-ls.nvim',
    config = function()
      require 'plugins.lsp.null-ls'
    end,
  },
}
