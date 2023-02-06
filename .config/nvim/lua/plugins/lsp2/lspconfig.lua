--

local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
local protocol_status_ok, protocol = pcall(require, 'vim.lsp.protocol')
local signature_status_ok, signature = pcall(require, 'lsp_signature')
local navic_status_ok, navic = pcall(require, 'nvim-navic')
if
  not lspconfig_status_ok
  and not cmp_nvim_lsp_status_ok
  and not protocol_status_ok
  and not signature_status_ok
  and not navic_status_ok
then
  return
end

local keymap = vim.keymap
local on_attach = function(client, bufnr)
  signature.on_attach(client, bufnr)
  navic.attach(client, bufnr)

  local opts = { noremap = true, silent = true, buffer = bufnr }

  keymap.set('n', 'gf', '<cmd>Lspsaga lsp_finder<CR>', opts)
  keymap.set('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', opts)
  keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
  keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opts)
  keymap.set('n', '<leader>d', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
  keymap.set('n', '<leader>d', '<cmd>Lspsaga show_cursor_diagnostics<CR>', opts)
  keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
  keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
  keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
  keymap.set('n', '<leader>o', '<cmd>LSoutlineToggle<CR>', opts)
end

-- used to enable autocompletion
local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig['gopls'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- lspconfig['golangci_lint_ls'].setup {
--   capabilities = capabilities,
--   on_attach = on_attach,
-- }

lspconfig['sumneko_lua'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
}

vim.lsp.handlers['textDocument/publishDiagnostics'] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = {
      spacing = 4,
      prefix = '',
    },
  })
