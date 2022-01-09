local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {}

local map = require("utils").map

map('n', '<leader>dd', '<cmd>NvimTreeToggle<cr>')
map('n', '<leader>df', '<cmd>NvimTreeFocus<cr>')

