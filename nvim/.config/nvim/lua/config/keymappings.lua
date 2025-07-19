-- better window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { silent = true })
vim.api.nvim_set_keymap('i', '<C-h>', '<ESC><C-w>h', { silent = true })
vim.api.nvim_set_keymap('i', '<C-j>', '<ESC><C-w>j', { silent = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<ESC><C-w>k', { silent = true })
vim.api.nvim_set_keymap('i', '<C-l>', '<ESC><C-w>l', { silent = true })

-- vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-n>', { silent = true })
-- vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-n><C-w>h', { silent = true })
-- vim.api.nvim_set_keymap('t', '<C-j>', '<C-\\><C-n><C-w>j', { silent = true })
-- vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-n><C-w>k', { silent = true })
-- vim.api.nvim_set_keymap('t', '<C-l>', '<C-\\><C-n><C-w>l', { silent = true })

-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })

-- Terminals
vim.api.nvim_set_keymap('n', '<C-t>v', ':vs|:te<CR>:set nonumber<CR>:set nospell<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-t>s', ':sp|:te<CR>:resize 15<CR>:set nonumber<CR>:set nospell<CR>',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<Leader><ESC>', '<C-\\><C-n>', { silent = true })

-- remove highlights
vim.api.nvim_set_keymap('n', '<ESC>', ':noh<CR>', { noremap = true, silent = true })

-- close quickfix window
vim.api.nvim_set_keymap('n', '<Leader>c', ':cclose<CR>', { silent = true })

-- buffer
vim.api.nvim_set_keymap('n', '<Leader>br', ':bp|bd#<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bb', ':b#<CR>', { silent = true })

-- diagnostic
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { desc = "vim.diagnostic.open_float" })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "vim.diagnostic.goto_prev" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "vim.diagnostic.goto_next" })
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { desc = "vim.diagnostic.setloclist" })

vim.keymap.set("n", "<Leader>yf", function()
  vim.fn.setreg('+', vim.fn.expand('%:t'))
end, { desc = "Copy file name" })
vim.keymap.set("n", "<Leader>yp", function()
  vim.fn.setreg('+', vim.fn.expand('%:p'))
end, { desc = "Copy file path" })
vim.keymap.set("n", "<Leader>ys", ":echo expand('%:p')<CR>", { desc = "Show full path." })
