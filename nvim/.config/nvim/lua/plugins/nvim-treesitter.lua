local M = {
  "nvim-treesitter/nvim-treesitter",
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
    {
      "Badhi/nvim-treesitter-cpp-tools",
      opts = {}
    }
  },
}

function M.opts()
  local configs = require "nvim-treesitter.configs"
  configs.setup {
    ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python", "c", "cpp", },
    sync_install = false,
    highlight = {
      enable = true,
    },
    indent = { enable = true, },
  }
end

return M
