local M = {
  'jmbuhr/otter.nvim',
  dependencies = {
    { 'neovim/nvim-lspconfig' },
  },
  opts = {
    buffers = {
      set_filetype = true,
    },
  },
}

return M
