--

local o = vim.o

local cmp_status_ok, cmp = pcall(require, 'cmp')
local snip_status_ok, luasnip = pcall(require, 'luasnip')
local lspkind_status_ok, lspkind = pcall(require, 'lspkind')

if not cmp_status_ok and not lspkind_status_ok and not snip_status_ok then
  return
end

-- load friendly snippets

require('luasnip/loaders/from_vscode').lazy_load()

o.completeopt = 'menu,menuone,noselect'

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-k>'] = cmp.mapping.select_prev_item(), -- previous suggestion
    ['<C-j>'] = cmp.mapping.select_next_item(), -- next suggestion
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm { select = false },
    --     ['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
    -- ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
    -- ['<C-e>'] = cmp.mapping.close(),
    -- ['<CR>'] = cmp.mapping.confirm { select = true },
    -- ['<Tab>'] = cmp.mapping(function(fallback)
    --   if luasnip.expandable() then
    --     luasnip.expand()
    --   elseif luasnip.expand_or_jumpable() then
    --     luasnip.expand_or_jump()
    --   else
    --     fallback()
    --   end
    -- end, {
    --   'i',
    --   's',
    -- }),
    -- ['<S-Tab>'] = cmp.mapping(function(fallback)
    --   if luasnip.jumpable(-1) then
    --     luasnip.jump(-1)
    --   else
    --     fallback()
    --   end
    -- end, {
    --   'i',
    --   's',
    -- }),
  },
  sources = cmp.config.sources {
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    -- { name = 'cmp_tabnine' },
    { name = 'treesitter' },
  },
  experimental = {
    ghost_text = true,
  },
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = '[Buffer]',
        nvim_lsp = '[LSP]',
        nvim_lua = '[Nvim]',
        path = '[Path]',
        -- vsnip = '[Vsnip]',
        luasnip = '[Snip]',
        -- cmp_tabnine = '[TabNine]',
        treesitter = '[Treesitter]',
        -- ultisnips = '[UltiSnip]',
      },
    },
  },
}

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }),
})
