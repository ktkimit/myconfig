local M = {
  "jose-elias-alvarez/null-ls.nvim",
  event = "BufReadPre",
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
      lazy = true,
    },
  },
}

function M.config()
  local null_ls = require "null-ls"

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics

  local sources = {
    -- python
    formatting.black,
    diagnostics.ruff,

    -- prose
    diagnostics.vale,

    -- cpp
    -- diagnostics.cppcheck,

  }

  null_ls.setup {
    sources = sources,
  }
end

return M
