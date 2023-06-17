local M = {
  "nvim-telescope/telescope.nvim",
  event = "Bufenter",
  cmd = { "Telescope" },
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { "ahmedkhalf/project.nvim" },
  },
}

M.opts = {
  defaults = {
    file_ignore_patterns = { ".git/", "node_modules", "^__pycache__/"
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
}

function M.config()
  require('telescope').load_extension('fzf')
  local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Telescope find_files"})
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "Telescope live_grep"})
  vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "Telescope buffers"})
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "Telescope help_tags"})
end

return M
