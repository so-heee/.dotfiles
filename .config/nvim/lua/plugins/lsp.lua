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

      vim.lsp.enable { 'lua_ls', 'gopls' }
    end,
  },
  {
    'williamboman/mason.nvim',
    opts = {},
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      local mason_servers = {
        'gopls',
        'lua_ls',
      }
      require('mason-lspconfig').setup {
        ensure_installed = mason_servers,
        automatic_enable = true,
      }
    end,
  },
  {
    'jay-babu/mason-null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim',
      'nvimtools/none-ls.nvim',
    },
    config = function()
      local masonnullls_status_ok, masonnullls = pcall(require, 'mason-null-ls')

      if not masonnullls_status_ok then
        return
      end

      masonnullls.setup {
        ensure_installed = {
          'stylua',
          'golangci_lint',
          'gofumpt',
          'goimports',
          'sqlfmt',
        },
        automatic_installation = true,
      }

      local status_ok, nullls = pcall(require, 'null-ls')
      if not status_ok then
        return
      end

      local formatting = nullls.builtins.formatting
      local diagnostics = nullls.builtins.diagnostics
      local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

      nullls.setup {
        sources = {
          formatting.stylua.with {
            command = 'stylua',
            args = {
              '--indent-type',
              'Spaces',
              '--indent-width',
              '2',
              '--search-parent-directories',
              '--stdin-filepath',
              '$FILENAME',
              '-', -- ← 標準入力を明示
            },
          },
          formatting.goimports,
          formatting.sqlfmt,
          diagnostics.golangci_lint,
        },
        -- configure on save
        on_attach = function(current_client, bufnr)
          if current_client.supports_method 'textDocument/formatting' then
            vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
            vim.api.nvim_create_autocmd('BufWritePre', {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format {
                  filter = function(client)
                    -- only format on save if the client supports formatting
                    return client.name == 'null-ls'
                  end,
                  bufnr = bufnr,
                }
              end,
            })
          end
        end,
      }
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
  {
    'nvimdev/lspsaga.nvim',
    event = 'LspAttach',
    config = function()
      require('lspsaga').setup {
        ui = {
          border = 'rounded',
        },
        lightbulb = {
          enable = false, -- コードアクション表示を無効化
        },
        symbol_in_winbar = {
          enable = false, -- ウィンドウバーのシンボル表示を無効化
        },
      }
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
  },
  {
    'ray-x/lsp_signature.nvim',
    event = 'LspAttach',
    config = function()
      require('lsp_signature').setup {
        max_width = 80,
        transparency = 10,
      }
    end,
  },
}
