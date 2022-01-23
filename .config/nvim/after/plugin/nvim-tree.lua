local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then return end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then return end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {auto_close = true, view = {width = 40}}

-- WhichKeyへ移行
-- local map = require("utils").map
--
-- map('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')
-- map('n', '<leader>fe', '<cmd>NvimTreeFocus<cr>')

local g = vim.g

g.nvim_tree_quit_on_open = 1
