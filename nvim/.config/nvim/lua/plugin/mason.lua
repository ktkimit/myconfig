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
  },
  ensure_installed = {
    "cpptools",
    "debugpy",
    "ruff",
    "vale",
    "black",
    "clang-format"
  }
}

function M.config()
  require("mason").setup(settings)
  require("mason-lspconfig").setup{
    ensure_installed = require("lsp").servers,
    automatic_installation = true,
  }

  vim.api.nvim_create_user_command("MasonInstallAll", function()
    vim.cmd("MasonInstall " .. table.concat(settings.ensure_installed, " "))
  end, {})
end

return M
