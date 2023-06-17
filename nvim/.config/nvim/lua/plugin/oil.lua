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
  vim.keymap.set("n", "<Leader>-", require("oil").toggle_float, { desc = "Toggle oil" })
end

return M
