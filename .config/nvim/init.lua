require 'options'
require 'mappings'
require 'plugins'
require 'filetypes'

if vim.g.vscode ~= nil then
  require 'vscode'
end
