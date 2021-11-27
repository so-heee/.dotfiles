UsePlugin 'lsp-colors.nvim'

lua << EOF
require("lsp-colors").setup({
  Error = "#ff5555",
  Warning = "#f1fa8c",
  Information = "#8be9fd",
  Hint = "#50fa7b"
})
EOF
