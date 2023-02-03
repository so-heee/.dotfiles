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

    -- 選択領域
    use {
      'terryma/vim-expand-region',
      config = "require('plugins.vim-expand-region')",
    }

    -- Nvim Only

    -- use {'rose-pine/neovim', config = "vim.cmd('colorscheme rose-pine')"}
    -- use {
    --   'projekt0n/github-nvim-theme',
    --   config = "require('config.github-theme')",
    -- }
    use {
      'folke/tokyonight.nvim',
      setup = function()
        vim.g.tokyonight_style = 'night'
      end,
      config = "vim.cmd('colorscheme tokyonight')",
    }
    --
    -- use {
    --   'dracula/vim',
    --   as = 'dracula',
    --   config = "vim.cmd('colorscheme dracula')",
    --   cond = not_vscode,
    -- }
    --
    -- use {
    --   'EdenEast/nightfox.nvim',
    --   config = "vim.cmd('colorscheme terafox')",
    --   cond = not_vscode,
    -- }
    --
    -- use {
    --   'haishanh/night-owl.vim',
    --   config = "vim.cmd('colorscheme night-owl')",
    -- }

    -- use {
    --   'rmehri01/onenord.nvim',
    --   config = "vim.cmd('colorscheme onenord')",
    -- }

    -- use {
    --   'overcache/NeoSolarized',
    --   config = function()
    --     vim.api.nvim_command 'set background=dark'
    --     vim.api.nvim_command 'colorscheme NeoSolarized'
    --   end,
    -- }

    -- Lua functions
    use { 'nvim-lua/plenary.nvim', cond = not_vscode }

    -- Popup API
    use { 'nvim-lua/popup.nvim', cond = not_vscode }

    -- アイコン
    use { 'kyazdani42/nvim-web-devicons', cond = not_vscode }

    -- バッファライン
    use {
      'akinsho/bufferline.nvim',
      after = 'nvim-web-devicons',
      config = function()
        require('bufferline').setup()
      end,
      cond = not_vscode,
    }

    -- ファイルエクスプローラー
    use {
      'kyazdani42/nvim-tree.lua',
      config = "require('plugins.nvim-tree')",
      cond = not_vscode,
    }

    -- シンタックスハイライト
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = "require('plugins.treesitter')",
      cond = not_vscode,
    }

    -- use {
    --   'nvim-treesitter/nvim-treesitter-textobjects',
    --   after = { 'nvim-treesitter' },
    --   cond = not_vscode,
    -- }

    -- ステータスライン
    use {
      'nvim-lualine/lualine.nvim',
      config = "require('plugins.lualine')",
      cond = not_vscode,
    }

    -- 自動ペアリング
    use {
      'windwp/nvim-autopairs',
      event = 'InsertEnter',
      config = "require('plugins.autopairs')",
      cond = not_vscode,
    }

    -- -- エラー一覧
    -- -- use {
    -- --   'folke/trouble.nvim',
    -- --   after = { 'mason', 'lsp-colors.nvim' },
    -- --   config = function()
    -- --     require('trouble').setup()
    -- --   end,
    -- --   cond = not_vscode,
    -- -- }
    --
    -- -- あいまい検索
    -- use {
    --   'nvim-telescope/telescope.nvim',
    --   event = 'VimEnter',
    --   config = "require('plugins.telescope')",
    --   cond = not_vscode,
    -- }
    --
    -- -- Git
    -- use {
    --   'lewis6991/gitsigns.nvim',
    --   requires = {
    --     'nvim-lua/plenary.nvim',
    --   },
    --   config = function()
    --     require('gitsigns').setup()
    --   end,
    --   cond = not_vscode,
    -- }
    --
    -- -- ターミナル
    -- use {
    --   'akinsho/toggleterm.nvim',
    --   config = "require('plugins.toggleterm')",
    --   cond = not_vscode,
    -- }

    -- コメント
    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end,
    }

    -- インデントの強調表示
    use {
      'lukas-reineke/indent-blankline.nvim',
      config = "require('plugins.indentline')",
      cond = not_vscode,
    }

    -- キーマップのポップアップ
    use {
      'folke/which-key.nvim',
      config = "require('plugins.whichkey')",
      cond = not_vscode,
    }

    -- -- -- Markdownプレビュー
    -- -- use {
    -- --   'iamcco/markdown-preview.nvim',
    -- --   run = 'cd app && yarn install',
    -- --   cond = not_vscode,
    -- -- }
    --
    -- スクロールバー
    use {
      'petertriho/nvim-scrollbar',
      config = "require('plugins.scrollbar')",
      cond = not_vscode,
    }

    -- Snippet collection
    use { 'rafamadriz/friendly-snippets' }
    -- Snippet engine
    use { 'L3MON4D3/LuaSnip' }
    -- Completion engine
    use {
      'hrsh7th/nvim-cmp',
      config = "require('plugins.lsp.nvim-cmp')",
    }
    -- Snippet completion source
    use { 'saadparwaiz1/cmp_luasnip' }
    -- Buffer completion source
    use { 'hrsh7th/cmp-buffer' }
    -- Path completion source
    use { 'hrsh7th/cmp-path' }
    -- Commadline completion source
    use { 'hrsh7th/cmp-cmdline' }
    use { 'tzachar/cmp-tabnine', run = './install.sh' }
    -- LSP completion source
    use { 'hrsh7th/cmp-nvim-lsp' }
    -- LSP Icons
    use {
      'onsails/lspkind-nvim',
      config = "require('plugins.lsp.lspkind')",
    }

    -- Built-in LSP
    use {
      'neovim/nvim-lspconfig',
      config = "require('plugins.lsp.lspconfig')",
    }
    -- Package Manager
    use {
      'williamboman/mason.nvim',
      config = "require('plugins.lsp.mason')",
    }
    -- LSP manager
    use { 'williamboman/mason-lspconfig.nvim' }
    use { 'SmiteshP/nvim-navic' }
    use { 'ray-x/lsp_signature.nvim' }
    use { 'glepnir/lspsaga.nvim' }
    use { 'folke/lsp-colors.nvim' }
    -- Formatting and linting
    use { 'jose-elias-alvarez/null-ls.nvim' }
    -- null-ls manager
    use {
      'jayp0521/mason-null-ls.nvim',
      config = "require('plugins.lsp.null-ls')",
    }

    -- -- 一旦保留
    -- -- -- スクリーンショット
    -- -- use 'segeljakt/vim-silicon'
    --
    -- -- use {
    -- --   'blackCauldron7/surround.nvim',
    -- --   config = "require('config.surround')",
    -- -- }
    --
    -- Neovimの高速化
    use {
      'lewis6991/impatient.nvim',
      config = function()
        require('impatient').enable_profile()
      end,
      cond = not_vscode,
    }
    -- --
    -- -- -- Notification Enhancer
    -- -- use {
    -- --   'rcarriga/nvim-notify',
    -- --   config = "require('config.notify')",
    -- --   cond = not_vscode,
    -- -- }
    -- --
    -- -- -- Cursorhold fix
    -- -- use {
    -- --   'antoinemadec/FixCursorHold.nvim',
    -- --   event = { 'BufRead', 'BufNewFile' },
    -- --   config = function()
    -- --     vim.g.cursorhold_updatetime = 100
    -- --   end,
    -- --   cond = not_vscode,
    -- -- }
    -- --
    -- -- -- エスケープをスムーズにする
    -- -- use {
    -- --   'max397574/better-escape.nvim',
    -- --   event = { 'InsertEnter' },
    -- --   config = function()
    -- --     require('better_escape').setup()
    -- --   end,
    -- --   cond = not_vscode,
    -- -- }
    -- --
    -- -- -- スタート画面
    -- -- use {
    -- --   'goolord/alpha-nvim',
    -- --   config = "require('config.alpha')",
    -- --   cond = not_vscode,
    -- -- }
    -- --
    -- -- -- カラーコードのハイライト
    -- -- use {
    -- --   'norcalli/nvim-colorizer.lua',
    -- --   config = function()
    -- --     require('colorizer').setup()
    -- --   end,
    -- --   cond = not_vscode,
    -- -- }
    -- --
    -- -- -- スクロールをスムーズにする
    -- -- use {
    -- --   'karb94/neoscroll.nvim',
    -- --   config = function()
    -- --     require('neoscroll').setup()
    -- --   end,
    -- --   cond = not_vscode,
    -- -- }
    -- --
    -- -- -- Goプラグイン
    -- -- use {
    -- --   'ray-x/go.nvim',
    -- --   config = "require('config.go')",
    -- --   cond = not_vscode,
    -- -- }
    -- --
    -- --
    -- -- -- 行ジャンプピーク
    -- -- use {
    -- --   'nacro90/numb.nvim',
    -- --   config = function()
    -- --     require('numb').setup()
    -- --   end,
    -- --   cond = not_vscode,
    -- -- }
    -- --
    -- -- -- キーワードハイライト
    -- -- use {
    -- --   'yamatsum/nvim-cursorline',
    -- --   config = "require('config.nvim-cursorline')",
    -- --   cond = not_vscode,
    -- -- }
    -- --
    -- -- -- 検索パネル
    -- -- use {
    -- --   'nvim-pack/nvim-spectre',
    -- --   config = "require('config.nvim-spectre')",
    -- --   cond = not_vscode,
    -- -- }
    -- --
    -- -- -- カーソル行のカラー
    -- -- use {
    -- --   'mvllow/modes.nvim',
    -- --   config = "require('config.modes')",
    -- --   cond = not_vscode,
    -- -- }
    -- --
    -- -- -- TODOコメントのハイライト
    -- -- use {
    -- --   'folke/todo-comments.nvim',
    -- --   requires = 'nvim-lua/plenary.nvim',
    -- --   event = 'VimEnter',
    -- --   config = function()
    -- --     require('todo-comments').setup()
    -- --   end,
    -- --   cond = not_vscode,
    -- -- }

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
