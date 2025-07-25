local M = {
"obsidian-nvim/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  -- lazy = true,
  -- ft = "markdown",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/doc/notes",
      },
    },
    daily_notes = {
      folder = "daily"
    },
    completion = {
      nvim_cmp = false,
      blink = true
    }
  },
}

return M
