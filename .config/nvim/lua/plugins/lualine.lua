local lualine_status_ok, lualine = pcall(require, 'lualine')
local navic_status_ok, navic = pcall(require, 'nvim-navic')
if not lualine_status_ok and not navic_status_ok then
  return
end

navic.setup {
  icons = {
    File = ' ',
    Module = ' ',
    Namespace = ' ',
    Package = ' ',
    Class = ' ',
    Method = ' ',
    Property = ' ',
    Field = ' ',
    Constructor = ' ',
    Enum = '練',
    Interface = '練',
    Function = ' ',
    Variable = ' ',
    Constant = ' ',
    String = ' ',
    Number = ' ',
    Boolean = '◩ ',
    Array = ' ',
    Object = ' ',
    Key = ' ',
    Null = 'ﳠ ',
    EnumMember = ' ',
    Struct = ' ',
    Event = ' ',
    Operator = ' ',
    TypeParameter = ' ',
  },
}

lualine.setup {
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
