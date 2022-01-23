local status_ok, which_key = pcall(require, "which-key")
if not status_ok then return end

which_key.setup()

local mappings = {
  q = {":q<cr>", "Quit"},
  Q = {":wq<cr>", "Save & Quit"},
  w = {":w<cr>", "Save"},
  x = {":bdelete<cr>", "Close"},
  t = {name = "ToggleTerm"},
  e = {"<cmd>NvimTreeToggle<cr>", "NvimTree"},
  f = {
    name = "Telescope",
    f = {"<cmd>Telescope find_files<cr>", "Find Files"},
    g = {"<cmd>Telescope live_grep<cr>", "Live Grep"},
    b = {"<cmd>Telescope buffers<cr>", "Buffers"}
  },
  g = {name = "Git", g = {"<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit"}},
  l = {
    name = "Lsp",
    w = {'<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', "Add Workspace Folder"},
    W = {'<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', "Remove Workspace Folder"},
    l = {
      '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>',
      "List Workspace Folders"
    },
    f = {"<cmd>lua vim.lsp.buf.declaration()<CR>", "Go To Declaration"},
    d = {"<cmd>lua vim.lsp.buf.definition()<CR>", "Go To Definition"},
    i = {"<cmd>lua vim.lsp.buf.implementation()<CR>", "Go To Implementation"},
    t = {"<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type Definition"},
    r = {"<cmd>lua vim.lsp.buf.references()<CR>", "References"},
    h = {"<cmd>Lspsaga lsp_finder<cr>", "Lspsaga Finder"},
    R = {"<cmd>Lspsaga rename<cr>", "Rename"},
    a = {"<cmd>Lspsaga code_action<cr>", "Code Action"},
    D = {"<cmd>Lspsaga preview_definition<cr>", "Preview Definition"},
    K = {"<cmd>Lspsaga hover_doc<cr>", "Hover Doc"},
    s = {"<cmd>Lspsaga signature_help<cr>", "Signature Help"},
    X = {'<cmd>Lspsaga show_line_diagnostics<cr>', "Show Line Diagnostics"},
    n = {'<cmd>Lspsaga diagnostic_jump_next<cr>', "Go To Next Diagnostic"},
    N = {'<cmd>Lspsaga diagnostic_jump_prev<cr>', "Go To Previous Diagnostic"},
    x = {"<cmd>TroubleToggle<cr>", "Trouble"}

  }
}

local opts = {prefix = '<leader>'}

which_key.register(mappings, opts)
