local status_ok, spectre = pcall(require, "spectre")
if not status_ok then
  return
end

spectre.setup()

vim.api.nvim_set_keymap('n', '<C-t>v', ':vs|:te<CR>:set nonumber<CR>:set nospell<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>du', ":lua require('dapui').toggle()<CR>", {noremap=true, silent=true})


vim.api.nvim_set_keymap('n', '<leader>S', ":lua require('spectre').open()<CR>", {noremap=true, silent=true})

-- search current word
vim.api.nvim_set_keymap('n', '<leader>sw', ":lua require('spectre').open_visual({select_word=true})<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('v', '<leader>S', ":lua require('spectre').open_visual()<CR>", {noremap=true, silent=true})

-- search in current file
vim.api.nvim_set_keymap('n', '<leader>sp', ":lua require('spectre').open_file_search()<cr>", {noremap=true, silent=true})
