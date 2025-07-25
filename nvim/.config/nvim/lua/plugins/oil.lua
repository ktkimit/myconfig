local M = {
  'stevearc/oil.nvim',

  dependencies = {
    {
      "nvim-tree/nvim-web-devicons",
    },
  },

  keys = {
    { "<Leader>-", "<CMD>Oil --float<CR>", desc = "Open parent directory" }
  },

  opts = {
    columns = {
      "icon",
      -- "permissions",
      "size",
      "mtime",
    },
    view_options = {
      show_hidden = true,
    },
  }
}

return M
