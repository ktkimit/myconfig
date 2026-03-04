local M = {
  "kylechui/nvim-surround",
  event = "VeryLazy",
  vim.keymap.set("x", "gs", "<Plug>(nvim-surround-visual)", {
    desc = "Add a surrounding pair around a visual selection",
  }),
  vim.keymap.set("x", "gS", "<Plug>(nvim-surround-visual-line)", {
    desc = "Add a surrounding pair around a visual selection, on new lines",
  })
}

return M
