require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    fuzzy = true,                    -- false will only do exact matching
    override_generic_sorter = true,  -- override the generic sorter
    override_file_sorter = true,     -- override the file sorter
    case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
  }
}

vim.api.nvim_set_keymap('n', '<Leader>tf', '<cmd>Telescope find_files<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>tg', '<cmd>Telescope live_grep<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>tb', '<cmd>Telescope buffers<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>th', '<cmd>Telescope help_tags<cr>', {noremap=true, silent=true})
