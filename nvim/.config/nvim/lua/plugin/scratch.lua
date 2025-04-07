local M = {
  "LintaoAmons/scratch.nvim",
  event = "VeryLazy",
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
  }
}

function M.config()
  require("scratch").setup({
    file_picker = "telescope",
    filetypes = { "md" },
  })
end

return M
