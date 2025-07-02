local M = {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    "mason-org/mason.nvim",
  },
}

function M.opts()
  local settings = {
    ensure_installed = require("lsp").servers,
    automatic_installation = true,
  }
  return settings
end

return M
