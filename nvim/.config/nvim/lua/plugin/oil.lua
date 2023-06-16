local M = {
  'stevearc/oil.nvim',

  dependencies = {
    {
      "nvim-tree/nvim-web-devicons",
      event = "VeryLazy",
    },
  },
}

local settings = {
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

function M.config()
  require("oil").setup(settings)
  vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
end

return M
