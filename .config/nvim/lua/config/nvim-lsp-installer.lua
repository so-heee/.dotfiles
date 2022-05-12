local nvim_lsp = require 'lspconfig'
local protocol = require 'vim.lsp.protocol'
-- local lsp_signature = require 'lsp_signature'

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- lsp_signature.on_attach(client, bufnr)

  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- 一部LspSagaを利用するためコメントアウト
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gf', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap(
    'n',
    '<leader>wl',
    '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
    opts
  )
  buf_set_keymap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  -- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  -- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  -- buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  --protocol.SymbolKind = { }
  protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '﬌', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '', -- TypeParameter
  }
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

-- Set up nvim-lsp-installer
local servers = {
  'gopls',
  -- 'sumneko_lua',
  -- 'jsonls',
  -- 'dockerls',
  -- 'yamlls',
  -- 'rust_analyzer',
}
local lsp_installer_servers = require 'nvim-lsp-installer.servers'
for _, lsp in ipairs(servers) do
  local ok, analyzer = lsp_installer_servers.get_server(lsp)
  if ok then
    if not analyzer:is_installed() then
      analyzer:install()
    end
  end
end

local lsp_installer = require 'nvim-lsp-installer'
lsp_installer.settings {
  ui = {
    icons = {
      server_installed = '✓',
      server_pending = '➜',
      server_uninstalled = '✗',
    },
  },
  log_level = vim.log.levels.DEBUG,
}
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  if server.name == 'gopls' then
    local gopls_opts = require 'config.lsp.settings.gopls'
    opts = vim.tbl_deep_extend('force', gopls_opts, opts)
  end

  if server.name == 'sumneko_lua' then
    local sumneko_opts = require 'config.lsp.settings.sumneko_lua'
    opts = vim.tbl_deep_extend('force', sumneko_opts, opts)
  end

  if server.name == 'jsonls' then
    local jsonls_opts = require 'config.lsp.settings.jsonls'
    opts = vim.tbl_deep_extend('force', jsonls_opts, opts)
  end

  if server.name == 'dockerls' then
    local dockerls_opts = require 'config.lsp.settings.dockerls'
    opts = vim.tbl_deep_extend('force', dockerls_opts, opts)
  end

  if server.name == 'yamlls' then
    local yamlls_opts = require 'config.lsp.settings.yamlls'
    opts = vim.tbl_deep_extend('force', yamlls_opts, opts)
  end

  if server.name == 'rust_analyzer' then
    local rust_analyzer_opts = require 'config.lsp.settings.rust_analyzer'
    opts = vim.tbl_deep_extend('force', rust_analyzer_opts, opts)
  end

  server:setup(opts)
  vim.cmd [[ do User LspAttachBuffers ]]
end)

-- icon
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    -- This sets the spacing and the prefix, obviously.
    virtual_text = {
      spacing = 4,
      prefix = '',
    },
  }
)
