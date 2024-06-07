local M = {
  "SmiteshP/nvim-navic",
  event = "VeryLazy",
  dependencies = "neovim/nvim-lspconfig",
}

function M.config()
  local navic = require("nvim-navic")
  navic.setup{
    highlight = true,
    click = true,
    lsp = {
      auto_attach = true,
    },
  }
  vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
end

return M
