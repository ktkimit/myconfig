local M = {
  "williamboman/mason.nvim",
}

function M.opts()
  local settings = {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    },
  }
  return settings
end

return M
