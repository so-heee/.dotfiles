local fn = vim.fn
local cmd = vim.cmd

-- プラグインの設定
-- Packer.nvimが無ければ自動インストールする
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
end

-- このファイル編集時に設定再読み込み
-- cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]

-- VSCodeでは読み込まない
local function not_vscode()
  return not vim.g.vscode
end

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

return packer.startup {
  function(use)
    -- プラグインマネージャー
    use 'wbthomason/packer.nvim'

    -- ヤンク時にハイライト
    use 'machakann/vim-highlightedyank'

    -- スクリーンショット
    use 'segeljakt/vim-silicon'

    -- 選択領域
    use {
      'terryma/vim-expand-region',
      config = "require('config.vim-expand-region')",
    }

    -- use {
    --   'blackCauldron7/surround.nvim',
    --   config = "require('config.surround')",
    -- }

    -- Nvim Only

    -- use {'rose-pine/neovim', config = "vim.cmd('colorscheme rose-pine')"}
    -- use {
    --   'projekt0n/github-nvim-theme',
    --   config = "require('config.github-theme')",
    -- }
    -- use {
    --   'folke/tokyonight.nvim',
    --   setup = function()
    --     vim.g.tokyonight_style = 'night'
    --   end,
    --   config = "vim.cmd('colorscheme tokyonight')",
    -- }
    --
    -- use {
    --   'dracula/vim',
    --   as = 'dracula',
    --   config = "vim.cmd('colorscheme dracula')",
    --   cond = not_vscode,
    -- }

    use {
      'EdenEast/nightfox.nvim',
      config = "vim.cmd('colorscheme terafox')",
      cond = not_vscode,
    }

    -- Neovimの高速化
    use {
      'lewis6991/impatient.nvim',
      config = function()
        require('impatient').enable_profile()
      end,
      cond = not_vscode,
    }

    -- Lua functions
    use { 'nvim-lua/plenary.nvim', cond = not_vscode }

    -- Popup API
    use { 'nvim-lua/popup.nvim', cond = not_vscode }

    -- Notification Enhancer
    use {
      'rcarriga/nvim-notify',
      config = "require('config.notify')",
      cond = not_vscode,
    }

    -- Cursorhold fix
    use {
      'antoinemadec/FixCursorHold.nvim',
      event = { 'BufRead', 'BufNewFile' },
      config = function()
        vim.g.cursorhold_updatetime = 100
      end,
      cond = not_vscode,
    }

    -- Icons
    use {
      'kyazdani42/nvim-web-devicons',
      cond = not_vscode,
    }

    -- Bufferline
    use {
      'akinsho/bufferline.nvim',
      after = 'nvim-web-devicons',
      config = function()
        require('bufferline').setup()
      end,
      cond = not_vscode,
    }

    -- File explorer
    use {
      'kyazdani42/nvim-tree.lua',
      config = "require('config.nvim-tree')",
      cond = not_vscode,
    }

    -- Statusline
    use {
      'nvim-lualine/lualine.nvim',
      after = { 'nvim-treesitter', 'nvim-gps' },
      config = "require('config.lualine')",
      cond = not_vscode,
    }

    use {
      'SmiteshP/nvim-gps',
      requires = 'nvim-treesitter/nvim-treesitter',
      config = function()
        require('nvim-gps').setup()
      end,
      after = { 'nvim-treesitter' },
      cond = not_vscode,
    }

    -- Syntax highlighting
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = "require('config.treesitter')",
      cond = not_vscode,
    }

    -- Completion engine
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        -- LSP completion source
        'hrsh7th/cmp-nvim-lsp',
        -- Buffer completion source
        'hrsh7th/cmp-buffer',
        -- Snippet completion source
        'saadparwaiz1/cmp_luasnip',
        -- Path completion source
        'hrsh7th/cmp-path',
        -- Commadline completion source
        'hrsh7th/cmp-cmdline',
        -- Neovim Lua API completion source
        'hrsh7th/cmp-nvim-lua',
        'onsails/lspkind-nvim',
      },
      after = { 'LuaSnip' },
      config = "require('config.cmp')",
    }

    use {
      'tzachar/cmp-tabnine',
      run = './install.sh',
    }

    -- Snippet collection
    use {
      'rafamadriz/friendly-snippets',
    }

    -- Snippet engine
    use {
      'L3MON4D3/LuaSnip',
      after = 'friendly-snippets',
      config = "require('config.luasnip')",
    }

    -- Autopairs
    use {
      'windwp/nvim-autopairs',
      event = 'InsertEnter',
      config = "require('config.autopairs')",
      cond = not_vscode,
    }

    -- Built-in LSP
    use {
      'neovim/nvim-lspconfig',
      requires = {
        -- LSP manager
        'williamboman/nvim-lsp-installer',
        'ray-x/lsp_signature.nvim',
        'tami5/lspsaga.nvim',
        'folke/lsp-colors.nvim',
        'ray-x/lsp_signature.nvim',
      },
      config = "require('config.lsp')",
    }

    use {
      'tamago324/nlsp-settings.nvim',
      after = { 'nvim-lspconfig' },
      cond = not_vscode,
    }

    use { 'b0o/schemastore.nvim', cond = not_vscode }

    -- LSP symbols
    use {
      'simrat39/symbols-outline.nvim',
      setup = function()
        vim.g.symbols_outline = { auto_close = true }
      end,
      cond = not_vscode,
    }

    -- Formatting and linting
    use {
      'jose-elias-alvarez/null-ls.nvim',
      after = 'nvim-lsp-installer',
      config = "require('config.null-ls')",
      cond = not_vscode,
    }

    use {
      'folke/trouble.nvim',
      after = { 'nvim-lsp-installer', 'lsp-colors.nvim' },
      config = function()
        require('trouble').setup()
      end,
      cond = not_vscode,
    }

    use {
      'j-hui/fidget.nvim',
      after = 'nvim-lsp-installer',
      config = function()
        require('fidget').setup()
      end,
      cond = not_vscode,
    }

    -- Fuzzy finder
    use {
      'nvim-telescope/telescope.nvim',
      event = 'VimEnter',
      config = "require('config.telescope')",
      cond = not_vscode,
    }

    -- Git integration
    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim',
      },
      config = function()
        require('gitsigns').setup()
      end,
      cond = not_vscode,
    }

    -- Start screen
    use {
      'goolord/alpha-nvim',
      config = "require('config.alpha')",
      cond = not_vscode,
    }

    -- Color highlighting
    use {
      'norcalli/nvim-colorizer.lua',
      config = function()
        require('colorizer').setup()
      end,
      cond = not_vscode,
    }

    -- Terminal
    use {
      'akinsho/toggleterm.nvim',
      config = "require('config.toggleterm')",
      cond = not_vscode,
    }

    -- Commenting
    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end,
    }

    -- Indentation
    use {
      'lukas-reineke/indent-blankline.nvim',
      config = "require('config.indentline')",
      cond = not_vscode,
    }

    -- Keymaps popup
    use {
      'folke/which-key.nvim',
      config = "require('config.whichkey')",
      cond = not_vscode,
    }

    -- Smooth scrolling
    use {
      'karb94/neoscroll.nvim',
      config = function()
        require('neoscroll').setup()
      end,
      cond = not_vscode,
    }

    -- Smooth escaping
    use {
      'max397574/better-escape.nvim',
      event = { 'InsertEnter' },
      config = function()
        require('better_escape').setup()
      end,
      cond = not_vscode,
    }

    use {
      'ray-x/go.nvim',
      config = "require('config.go')",
      cond = not_vscode,
    }

    use {
      'iamcco/markdown-preview.nvim',
      run = 'cd app && yarn install',
      cond = not_vscode,
    }

    use {
      'folke/todo-comments.nvim',
      requires = 'nvim-lua/plenary.nvim',
      config = function()
        require('todo-comments').setup()
      end,
      cond = not_vscode,
    }

    use {
      'tversteeg/registers.nvim',
      cond = not_vscode,
    }

    use {
      'petertriho/nvim-scrollbar',
      requires = 'kevinhwang91/nvim-hlslens',
      config = "require('config.scrollbar')",
      cond = not_vscode,
    }

    use {
      'nacro90/numb.nvim',
      config = function()
        require('numb').setup()
      end,
      cond = not_vscode,
    }

    -- カーソル行のカラー
    use {
      'mvllow/modes.nvim',
      config = "require('config.modes')",
      cond = not_vscode,
    }

    if Packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float { border = 'single' }
      end,
    },
  },
}
