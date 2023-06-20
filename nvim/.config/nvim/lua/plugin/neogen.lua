local M = {
  "danymat/neogen",
  event = "VeryLazy",
  dependencies = "nvim-treesitter/nvim-treesitter",
}

function M.config()
  require('neogen').setup {
    languages = {
      python = {
        template = {
          annotation_convention = "reST",
        }
      },
    }
  }
  local opts = { noremap = true, silent = true }
  vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate({ type = 'func' })<CR>", opts)
  vim.api.nvim_set_keymap("n", "<Leader>nc", ":lua require('neogen').generate({ type = 'class' })<CR>", opts)
  vim.api.nvim_set_keymap("n", "<Leader>nt", ":lua require('neogen').generate({ type = 'type' })<CR>", opts)
  vim.api.nvim_set_keymap("n", "<Leader>nm", ":lua require('neogen').generate({ type = 'file' })<CR>", opts)
end

return M
