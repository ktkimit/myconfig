local M = {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "VeryLazy",
    },
    {
      "nvim-treesitter/nvim-treesitter-refactor",
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
    refactor = {
      highlight_definitions = {
        enable = true,
        -- Set to false if you have an `updatetime` of ~100.
        clear_on_cursor_move = true,
      },
      smart_rename = {
        enable = true,
        -- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
        keymaps = {
          smart_rename = "gR",
        },
      },
    },
  }
end

return M
