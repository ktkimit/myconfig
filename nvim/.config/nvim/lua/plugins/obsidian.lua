local workspaces = {
  {
    name = "personal",
    path = "~/doc/notes",
  },
}

local function workspaces_exist()
  for _, ws in ipairs(workspaces) do
    if vim.fn.isdirectory(vim.fn.expand(ws.path)) == 1 then
      return true
    end
  end
  return false
end

local M = {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  -- lazy = true,
  -- ft = "markdown",
  event = "VeryLazy",
  cond = workspaces_exist,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = workspaces,
    daily_notes = {
      folder = "daily"
    },
    completion = {
      nvim_cmp = false,
      blink = true
    },
    legacy_commands = false
  },
}

return M
