local dap = require('dap')

vim.fn.sign_define('DapBreakpoint', {text='', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='', texthl='', linehl='', numhl=''})

vim.api.nvim_set_keymap('n', '<F5>', ":lua require'dap'.continue()<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<F10>', ":lua require'dap'.step_over()<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<F11>', ":lua require'dap'.step_into()<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<F12>', ":lua require'dap'.step_out()<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>db', ":lua require'dap'.toggle_breakpoint()<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>dr', ":lua require'dap'.repl.open()<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>dc', ":lua require'dap'.run_to_cursor()<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>dt', ":lua require'dap'.terminate()<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>dq', ":lua require'dap'.terminate()<CR>:lua require'dap'.repl.close()<CR>", {noremap=true, silent=true})