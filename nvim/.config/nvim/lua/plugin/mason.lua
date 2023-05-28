local M = {
  "williamboman/mason.nvim",
  build = ":MasonUpdate", -- :MasonUpdate updates registry contents
  dependencies = {
    {
      "williamboman/mason-lspconfig.nvim",
      lazy = true,
    },
  },
}

local settings = {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
}

function M.config()
  require("mason").setup(settings)
  require("mason-lspconfig").setup()
end

return M
