local dap_install = require("dap-install")
local dbg_list = require("dap-install.api.debuggers").get_installed_debuggers()

dap_install.setup({
	installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
})

dap_install.config(
"python",
{
  adapters = {
    type = "executable",
    command = "/Users/ktkim/.local/share/nvim/dapinstall/python/bin/python3.9",
    args = {"-m", "debugpy.adapter"}
  },
  configurations = {
    {
      type = "python",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
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
}
)
