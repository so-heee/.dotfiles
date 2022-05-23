local status_ok, gps = pcall(require, 'nvim-gps')
if not status_ok then
  return
end

gps.setup()

require('lualine').setup {
  options = {
    section_separators = '',
    component_separators = '',
  },
  sections = {
    lualine_c = {
      { gps.get_location, cond = gps.is_available },
    },
  },
}
