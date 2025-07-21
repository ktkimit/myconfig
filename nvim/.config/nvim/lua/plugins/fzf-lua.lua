local M = {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

function M.opts()
  vim.keymap.set("n", "<Leader>ff", ":lua require('fzf-lua').files()<CR>", { desc = "FzfLua files" })
  vim.keymap.set("n", "<Leader>fo", ":lua require('fzf-lua').oldfiles()<CR>", { desc = "FzfLua oldfiles" })
  vim.keymap.set("n", "<Leader>fb", ":lua require('fzf-lua').buffers()<CR>", { desc = "FzfLua buffers" })
  vim.keymap.set("n", "<Leader>fg", ":lua require('fzf-lua').live_grep()<CR>", { desc = "FzfLua live_grep" })
  vim.keymap.set("n", "<leader>fr", ":lua require('fzf-lua').lsp_references()<CR>", { desc = "FzfLua lsp_references" })
  vim.keymap.set("n", "<leader>fd", ":lua require('fzf-lua').lsp_definitions()<CR>", { desc = "FzfLua lsp_definitions" })
  vim.keymap.set("n", "<Leader>fp", ":lua require('fzf-lua').grep_project()<CR>", { desc = "FzfLua grep_project" })
  vim.keymap.set("n", "<F1>", ":lua require('fzf-lua').help_tags()<CR>", { desc = "FzfLua help_tags" })
  return {}
end

return M
