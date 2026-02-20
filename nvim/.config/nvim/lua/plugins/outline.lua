local M = {
  "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  keys = {
    { "<space>o", "<cmd>Outline<CR>",      desc = "Toggle outline" },
    { "<space>l", "<cmd>OutlineFocus<CR>", desc = "Toggle outline focus" },
  },
  opts = {
    keymaps = {
      goto_and_close = '<C-o>'
    }
  },
}

return M
