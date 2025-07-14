local M = {
  "nvimtools/none-ls.nvim",
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
    },
  },
}

function M.opts()
  local null_ls = require("null-ls")

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics

  local sources = {
    -- python
    formatting.black,
    formatting.isort,
    diagnostics.mypy.with({
      extra_args = function()
        local virtual = os.getenv("VIRTUAL_ENV") or "/usr"
        return { "--python-executable", virtual .. "/bin/python3" }
      end,
    }),

    -- prose
    -- diagnostics.vale,

    -- cpp
    -- diagnostics.cppcheck,
    formatting.clang_format,

  }

  local settings = {
    sources = sources,
  }

  return settings
end

return M
