local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local h_status_ok, harpoon = pcall(require, "harpoon")
if not h_status_ok then
  return
end
telescope.load_extension "harpoon"

vim.api.nvim_set_keymap('n', '<Leader>ma', ':lua require("harpoon.mark").add_file()<CR>',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>mt', ':lua require("harpoon.ui").toggle_quick_menu()<CR>',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>mn', ':lua require("harpoon.ui").nav_next()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>mp', ':lua require("harpoon.ui").nav_prev()<CR>', { noremap = true, silent = true })

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end
telescope.load_extension('harpoon')
vim.api.nvim_set_keymap('n', '<Leader>tm', '<cmd>Telescope harpoon marks<cr>', {noremap=true, silent=true})
