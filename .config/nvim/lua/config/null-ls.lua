-- 必要なフォーマッタは別でインストールする必要がある
local null_ls = require 'null-ls'
local formatting = null_ls.builtins.formatting

null_ls.setup {
  sources = {
    formatting.pg_format,
    formatting.stylua.with {
      extra_args = { '--config-path', vim.fn.expand '~/.config/stylua.toml' },
    },
  },
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd 'autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()'
    end
    vim.cmd [[
      augroup document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]
  end,
}
