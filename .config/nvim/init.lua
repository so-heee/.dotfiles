require("config.filetypes")

if not vim.g.vscode then
	require("config.options")
	require("config.mappings")
	require("config.lazy")
else
	require("config.vscode")
end
