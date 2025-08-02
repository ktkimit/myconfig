local M = {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

function M.opts()
  vim.keymap.set("n", "<Leader>ff", ":FzfLua files<CR>", { silent=true, desc = "FzfLua files" })
  vim.keymap.set("n", "<Leader>fo", ":FzfLua oldfiles<CR>", { silent=true, desc = "FzfLua oldfiles" })
  vim.keymap.set("n", "<Leader>fb", ":FzfLua buffers<CR>", { silent=true, desc = "FzfLua buffers" })
  vim.keymap.set("n", "<Leader>fg", ":FzfLua live_grep<CR>", { silent=true, desc = "FzfLua live_grep" })
  vim.keymap.set("n", "<leader>fr", ":FzfLua lsp_references<CR>", { silent=true, desc = "FzfLua lsp_references" })
  vim.keymap.set("n", "<leader>fd", ":FzfLua lsp_definitions<CR>", { silent=true, desc = "FzfLua lsp_definitions" })
  vim.keymap.set("n", "<Leader>fp", ":FzfLua grep_project<CR>", { silent=true, desc = "FzfLua grep_project" })
  vim.keymap.set("n", "<F1>", ":FzfLua help_tags<CR>", { silent=true, desc = "FzfLua help_tags" })
  return {}
end

return M
