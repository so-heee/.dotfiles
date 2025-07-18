return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    chunk = {
        enable = true
    },
    indent = {
        enable = true
    },
    blank = {
        enable = true
    },
    line_num = {
        enable = true
    }
  }
}
