local M = {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
}

function M.config()
  local dap = require "dap"

  -- load from json file like vscode
  require('dap.ext.vscode').load_launchjs()

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

  vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
    require('dap.ui.widgets').hover()
  end)
  vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
    require('dap.ui.widgets').preview()
  end)
  vim.keymap.set('n', '<Leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
  end)
  vim.keymap.set('n', '<Leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
  end)

  vim.api.nvim_exec([[ au FileType dap-repl lua require('dap.ext.autocompl').attach() ]], false)

  local dap_ui_status_ok, dapui = pcall(require, "dapui")
  if not dap_ui_status_ok then
    return
  end

  dap.listeners.before.attach.dapui_config = function()
    dapui.open()
  end
  dap.listeners.before.launch.dapui_config = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
  end
  dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
  end

  dap.adapters.python = function(cb, config)
    if config.request == 'attach' then
      ---@diagnostic disable-next-line: undefined-field
      local port = (config.connect or config).port
      ---@diagnostic disable-next-line: undefined-field
      local host = (config.connect or config).host or '127.0.0.1'
      cb({
        type = 'server',
        port = assert(port, '`connect.port` is required for a python `attach` configuration'),
        host = host,
        options = {
          source_filetype = 'python',
        },
      })
    else
      cb({
        type = 'executable',
        command = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python",
        args = { '-m', 'debugpy.adapter' },
        options = {
          source_filetype = 'python',
        },
      })
    end
  end
  dap.configurations.python = {
    {
      type = "python",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
      -- justMyCode = false,
      pythonPath = function()
        local vnv = os.getenv("VIRTUAL_ENV")
        local conda_env = os.getenv("CONDA_PREFIX")
        if vnv ~= nil and vim.fn.executable(vnv .. "/bin/python") then
          return vnv .. "/bin/python3"
        elseif conda_env ~= nil and vim.fn.executable(conda_env .. "/bin/python") then
          return conda_env .. "/bin/python3"
        else
          return "/usr/bin/python3"
        end
      end
    }
  }

  -- cpp
  dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = vim.fn.stdpath("data") .. '/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
  }

  dap.configurations.cpp = {
    {
      name = "Launch file",
      type = "cppdbg",
      request = "launch",
      MIMode = 'gdb',
      miDebuggerPath = '/usr/bin/gdb',
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopAtEntry = true,
      setupCommands = {
        {
          text = '-enable-pretty-printing',
          description =  'enable pretty printing',
          ignoreFailures = false
        },
      },
    },
  }

end

return M
