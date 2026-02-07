local M = {
  "OXY2DEV/markview.nvim",
  lazy = false,

  opts = {
    preview = {
      filetypes = { "md", "markdown", "quarto", "codecompanion" },
      ignore_buftypes = {},
    }
  },

  dependencies = {
    "saghen/blink.cmp"
  },
}

return M
