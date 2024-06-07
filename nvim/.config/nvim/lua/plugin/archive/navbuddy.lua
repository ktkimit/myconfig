local M = {
  "SmiteshP/nvim-navbuddy",
  event = "VeryLazy",
  dependencies = {
    "neovim/nvim-lspconfig",
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
  },
}

function M.config()
  local navbuddy = require "nvim-navbuddy"
  navbuddy.setup{
    lsp = {
      auto_attach = true
    }
  }

  vim.api.nvim_set_keymap('n', '<Space>b', ":lua require'nvim-navbuddy'.open()<CR>", {noremap=true, silent=true})
end

return M
