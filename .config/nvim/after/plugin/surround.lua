local status_ok, surround = pcall(require, "surround")
if not status_ok then
	return
end

-- default settings
surround.setup {
  mappings_style = "surround",
}

