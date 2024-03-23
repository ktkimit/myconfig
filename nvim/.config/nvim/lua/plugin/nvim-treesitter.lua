local M = {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
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
      "nvim-tree/nvim-web-devicons",
      event = "VeryLazy",
    },
    {"LiadOz/nvim-dap-repl-highlights"}
  },
}

function M.config()
  local configs = require "nvim-treesitter.configs"
  require('nvim-dap-repl-highlights').setup()

  configs.setup {
    ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python", "c", "cpp", 'dap_repl' },
    ignore_install = { "" },
    sync_install = false,

    highlight = {
      enable = true,
      disable = { "css" },
    },
    indent = { enable = true,},

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

  require('nvim-treesitter.configs').setup {}
end

return M
