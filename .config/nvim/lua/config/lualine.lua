local status_ok, navic = pcall(require, 'nvim-navic')
if not status_ok then
  return
end

require('lspconfig').clangd.setup {
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
  end,
}

require('lualine').setup {
  options = {
    section_separators = '',
    component_separators = '',
  },
  sections = {
    lualine_c = {
      { navic.get_location, cond = navic.is_available },
    },
  },
}
