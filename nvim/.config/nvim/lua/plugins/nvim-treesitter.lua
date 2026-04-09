local M = {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  opts = {},
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "VeryLazy",
    },
    {
      "nvim-treesitter/nvim-treesitter-context",
      event = "LspAttach",
      opts = {},
    },
    {
      "nvim-tree/nvim-web-devicons",
      event = "VeryLazy",
    },
    { "LiadOz/nvim-dap-repl-highlights" },
  },
}

function M.config(_, opts)
  local ts = require("nvim-treesitter")
  ts.setup(opts)

  if ts.install then
    ts.install {
      "lua", "markdown", "markdown_inline", "bash", "python", "c", "cpp", "regex", "diff"
    }
  end

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
      pcall(vim.treesitter.start)
      if ts.indentexpr then
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    end,
  })
end

return M
