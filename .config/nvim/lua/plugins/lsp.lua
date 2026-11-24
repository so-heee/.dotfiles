return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Lua Language Server
      vim.lsp.config('lua_ls', {
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            },
            diagnostics = {
              globals = { 'vim' },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file('', true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      -- Go Language Server
      vim.lsp.config('gopls', {
        capabilities = capabilities,
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
          },
        },
      })

      -- TypeScript Language Server
      vim.lsp.config('ts_ls', {
        capabilities = capabilities,
      })

      -- Python Language Server
      vim.lsp.config('pyright', {
        capabilities = capabilities,
      })

      -- Terraform Language Server
      vim.lsp.config('terraformls', {
        capabilities = capabilities,
      })

      -- YAML Language Server
      vim.lsp.config('yamlls', {
        capabilities = capabilities,
      })

      -- Bash Language Server
      vim.lsp.config('bashls', {
        capabilities = capabilities,
      })

      vim.lsp.enable({
        'lua_ls',
        'gopls',
        'ts_ls',
        'pyright',
        'terraformls',
        'yamlls',
        'bashls',
      })
    end,
  },
  {
    'mason-org/mason.nvim',
    opts = {},
  },
  {
    'mason-org/mason-lspconfig.nvim',
    config = function()
      local mason_servers = {
        'gopls',
        'lua_ls',
        'ts_ls',
        'pyright',
        'terraformls',
        'yamlls',
        'bashls',
      }
      require('mason-lspconfig').setup({
        ensure_installed = mason_servers,
        automatic_enable = false,
      })
    end,
  },
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    'saghen/blink.cmp',
    version = '1.*',
    event = { 'InsertEnter', 'CmdLineEnter' },
    opts = {
      keymap = { preset = 'enter' },
      signature = { enabled = true },
      sources = {
        default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
            score_offset = 100,
          },
        },
      },
    },
    opts_extend = { 'sources.default' },
  },
  {
    'folke/trouble.nvim',
    opts = {},
    cmd = 'Trouble',
  },
}
