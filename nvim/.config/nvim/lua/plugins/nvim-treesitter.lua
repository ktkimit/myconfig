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
    },
    {
      "nvim-tree/nvim-web-devicons",
      event = "VeryLazy",
    },
    { "LiadOz/nvim-dap-repl-highlights" }
  },
}

function M.opts()
  local settings = {
    ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python", "c", "cpp", 'dap_repl' },
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

  return settings
end

return M
