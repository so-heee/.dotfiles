if not vim.g.vscode then
	require("config.lazy")
else
	require("config.vscode")
end

require("config.filetypes")
require("config.options")
require("config.mappings")
