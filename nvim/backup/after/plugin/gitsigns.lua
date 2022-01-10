local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end

-- default settings
gitsigns.setup {}
