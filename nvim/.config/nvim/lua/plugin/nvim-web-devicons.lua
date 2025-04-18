local M = {
  "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
  opts = {},
}

function M.config()
  require("nvim-web-devicons").setup{
    override = {
      zsh = {
        icon = "",
        color = "#428850",
        cterm_color = "65",
        name = "Zsh",
      },
    },

  }
end

return M
