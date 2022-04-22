local gps = require 'nvim-gps'

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
