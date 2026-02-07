return {
  "olimorris/codecompanion.nvim",
  version = "^18.0.0",
  opts = {},
  keys = {
    {
      "<C-a>",
      mode = { "n", "v" },
      "<cmd>CodeCompanionActions<cr>",
      desc = "CodeCompanionActions"
    },
    {
      "<LocalLeader>a",
      mode = { "n", "v" },
      "<cmd>CodeCompanionChat Toggle<cr>",
      desc = "CodeCompanionChat Toggle"
    },
    {
      "ga",
      mode = { "v" },
      "<cmd>CodeCompanionChat Add<cr>",
      desc = "CodeCompanionChat Add"
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "zbirenbaum/copilot.lua",
  },
}
