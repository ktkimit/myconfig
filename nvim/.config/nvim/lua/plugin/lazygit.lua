local M = {
  "kdheepak/lazygit.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim" },
}

function M.config()
  vim.api.nvim_set_keymap('n', '<Leader>lg', '<cmd>LazyGit<CR>', {noremap=true, silent=true})
end

return M
