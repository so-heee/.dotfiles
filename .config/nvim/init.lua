require("config.options")
require("config.filetypes")
require("config.mappings")

if not vim.g.vscode then
	require("config.lazy")
else
	require("config.vscode")
end
