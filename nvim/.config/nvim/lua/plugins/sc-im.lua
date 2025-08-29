return {
  'DAmesberger/sc-im.nvim',
  lazy = true,
  opts = {
  },

  vim.keymap.set("n", "<Leader>sc", ":lua require'sc-im'.open_in_scim()<CR>", { silent = true, desc = "Open in scim" }),
}
