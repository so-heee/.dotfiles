-- 必要なフォーマッタは別でインストールする必要がある
local null_ls = require 'null-ls'
local formatting = null_ls.builtins.formatting
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format {
    filter = function(clients)
      return vim.tbl_filter(function(client)
        return client.name ~= { 'sumneko_lua' }
      end, clients)
    end,
    bufnr = bufnr,
  }
end

null_ls.setup {
  sources = {
    formatting.stylua.with {
      extra_args = { '--config-path', vim.fn.expand '~/.config/stylua.toml' },
    },
    -- Prettier
    formatting.prettier.with {
      filetypes = { 'html', 'json', 'yaml', 'markdown' },
    },
  },
  on_attach = function(client, bufnr)
    if client.supports_method 'textDocument/formatting' then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          -- vim.lsp.buf.formatting_sync()
          lsp_formatting(bufnr)
        end,
      })
    end
  end,
}
