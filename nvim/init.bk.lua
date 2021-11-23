----------------------------------------------------------------------------------
-- vscode neovim のluaサポートが不明のため一旦lua化中止
----------------------------------------------------------------------------------

require('core/options')
require('core/mappings')

if vim.g.vscode ~= nil then
  require('core/vscode')
end
