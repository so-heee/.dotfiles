-- 必要なフォーマッタは別でインストールする必要がある
local null_ls = require 'null-ls'
local formatting = null_ls.builtins.formatting

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
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd [[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]]
    end
  end,
}
