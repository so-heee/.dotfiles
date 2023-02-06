--

local mason_status_ok, mason = pcall(require, 'mason')
local masonlspconfig_status_ok, masonlspconfig = pcall(require, 'mason-lspconfig')
local masonnullls_status_ok, masonnullls = pcall(require, 'mason-null-ls')

if not mason_status_ok and not masonlspconfig_status_ok and not masonnullls_status_ok then
  return
end

mason.setup {
  ui = {
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗',
    },
  },
}

masonlspconfig.setup {
  ensure_installed = {
    'gopls',
    -- 'golangci_lint_ls',
    'sumneko_lua',
  },
  -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
}

masonnullls.setup {
  sources = {
    'luacheck',
    'golangci_lint',
    'gofumpt',
    'gopls',
    'goimports',
  },
  -- auto-install configured servers (with lspconfig)
  automatic_installation = true,
}
