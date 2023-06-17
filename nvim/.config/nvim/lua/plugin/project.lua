local M = {
  "ahmedkhalf/project.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope.nvim",
      event = "Bufenter",
      cmd = { "Telescope" },
    },
  },
}

function M.config()
  local project = require "project_nvim"
  project.setup {}

  local telescope = require "telescope"
  telescope.load_extension "projects"
end

return M
