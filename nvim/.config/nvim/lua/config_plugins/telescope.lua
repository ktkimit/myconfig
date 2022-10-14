local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    file_ignore_patters = {
      "^__pycache__/"
    },
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
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
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  }
}

telescope.load_extension('fzf')
telescope.load_extension('zk')

vim.api.nvim_set_keymap('n', '<Leader>tf', '<cmd>Telescope find_files<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>tg', '<cmd>Telescope live_grep<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>tb', '<cmd>Telescope buffers<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>th', '<cmd>Telescope help_tags<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>tm', '<cmd>Telescope media_files<CR>', {noremap=true, silent=true})
