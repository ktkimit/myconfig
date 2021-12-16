-- nvim-tree
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap=true, silent=true})

-- better window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent=true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent=true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent=true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent=true})
vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-n><C-w>h', {silent=true})
vim.api.nvim_set_keymap('t', '<C-j>', '<C-\\><C-n><C-w>j', {silent=true})
vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-n><C-w>k', {silent=true})
vim.api.nvim_set_keymap('t', '<C-l>', '<C-\\><C-n><C-w>l', {silent=true})

-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap=true, silent=true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap=true, silent=true})

-- Terminals
vim.api.nvim_set_keymap('n', '<C-t>v', ':vs|:te<CR>:set nonumber<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<C-t>s', ':sp|:te<CR>:resize 15<CR>:set nonumber<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('t', '<Leader><ESC>', '<C-\\><C-n>', {silent=true})
