local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end

vim.fn.sign_define('DapBreakpoint', {text='', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='', texthl='', linehl='', numhl=''})

vim.api.nvim_set_keymap('n', '<F5>', ":lua require'dap'.continue()<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<F5>', "<cmd>:lua require'dap'.continue()<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<F10>', ":lua require'dap'.step_over()<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<F10>', "<cmd>:lua require'dap'.step_over()<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<F11>', ":lua require'dap'.step_into()<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<F11>', "<cmd>:lua require'dap'.step_into()<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<F12>', ":lua require'dap'.step_out()<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<F12>', "<cmd>:lua require'dap'.step_out()<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>db', ":lua require'dap'.toggle_breakpoint()<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>dr', ":lua require'dap'.repl.open()<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>dc', ":lua require'dap'.run_to_cursor()<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>dt', ":lua require'dap'.terminate()<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>dq', ":lua require'dap'.terminate()<CR>:lua require'dap'.repl.close()<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>dh', ":lua require('dap.ui.widgets').hover()<CR>", {noremap=true, silent=true})

vim.api.nvim_exec([[ au FileType dap-repl lua require('dap.ext.autocompl').attach() ]], false)

-- python
dap.adapters.python = {
  type = "executable",
  command = "/Users/ktkim/.local/share/nvim/dapinstall/python/bin/python3.9",
  args = {"-m", "debugpy.adapter"}
}
dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
    justMyCode = false,
    pythonPath = function()
      local vnv = os.getenv("VIRTUAL_ENV")
      local conda_env = os.getenv("CONDA_PREFIX")
      if vnv ~= nil and vim.fn.executable(vnv .. "/bin/python") then
        return vnv .. "/bin/python3"
      elseif conda_env ~= nil and vim.fn.executable(conda_env .. "/bin/python") then
        return conda_env .. "/bin/python3"
      else
        return "/usr/local/bin/python3"
      end
    end
  }
}


