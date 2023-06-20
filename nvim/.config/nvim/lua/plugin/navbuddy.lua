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
  vim.api.nvim_set_keymap('n', '<Space>b', ":lua require'nvim-navbuddy'.open()<CR>", {noremap=true, silent=true})
end

return M
