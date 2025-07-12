local M = {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

function M.opts()
  vim.keymap.set("n", "<Leader>ff", ":lua require('fzf-lua').files()<CR>", { desc = "FzfLua files" })
  vim.keymap.set("n", "<Leader>fb", ":lua require('fzf-lua').buffers()<CR>", { desc = "FzfLua buffers" })
  vim.keymap.set("n", "<Leader>fg", ":lua require('fzf-lua').live_grep_glob()<CR>", { desc = "FzfLua live_grep_glob" })
  vim.keymap.set("n", "<Leader>fp", ":lua require('fzf-lua').grep_project()<CR>", { desc = "FzfLua grep_project" })
  vim.keymap.set("n", "<F1>", ":lua require('fzf-lua').help_tags()<CR>", { desc = "FzfLua help_tags" })
  return {}
end

return M
