local M = {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  vim.api.nvim_set_keymap('n', ']b', '<cmd>BufferLineCycleNext<CR>', { noremap = true, silent = true }),
  vim.api.nvim_set_keymap('n', '[b', '<cmd>BufferLineCyclePrev<CR>', { noremap = true, silent = true }),
  vim.api.nvim_set_keymap('n', '<Leader>be', '<cmd>BufferLineSortByExtension<CR>', { noremap = true, silent = true }),
  vim.api.nvim_set_keymap('n', '<Leader>bd', '<cmd>BufferLineSortByDirectory<CR>', { noremap = true, silent = true }),
  vim.api.nvim_set_keymap('n', '<Leader>bp', '<cmd>BufferLinePick<CR>', { noremap = true, silent = true }),
  vim.api.nvim_set_keymap('n', '<Leader>bcl', '<cmd>BufferLineCloseLeft<CR>', { noremap = true, silent = true }),
  vim.api.nvim_set_keymap('n', '<Leader>bcr', '<cmd>BufferLineCloseRight<CR>', { noremap = true, silent = true }),
  opts = {}
}

return M
