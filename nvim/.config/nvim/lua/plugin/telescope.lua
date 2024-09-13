local M = {
  "nvim-telescope/telescope.nvim",
  event = "Bufenter",
  cmd = { "Telescope" },
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
}

M.opts = {
  defaults = {
    file_ignore_patterns = { ".git/", "node_modules", "^__pycache__/"
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
}

function M.config()
  local telescope = require('telescope')

  telescope.load_extension('fzf')
  telescope.load_extension("live_grep_args")

  local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Telescope find_files" })
  -- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "Telescope live_grep"})
  vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Telescope buffers" })
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Telescope help_tags" })
  vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = "Telescope lsp_references" })
  vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = "Telescope oldfiles" })

  vim.keymap.set('n', '<leader>fg', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
    { desc = "Telescope live_grep" })
end

return M
