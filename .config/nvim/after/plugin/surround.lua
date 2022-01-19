local status_ok, surround = pcallrequire, "surround"
if not status_ok then
	return
end

-- default settings
surround.setup {
  mappings_style = "surround",
}

