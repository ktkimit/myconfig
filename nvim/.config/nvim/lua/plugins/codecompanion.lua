return {
  "olimorris/codecompanion.nvim",
  version = "^18.0.0",
  opts = {
    extensions = {
      history = {
        opts = {
          save_chat_keymap = "<LocalLeader>s",
          picker = "fzf-lua",
          picker_keymaps = {
            delete = { n = "d", i = "<M-q>" },
          },
        }
      }
    }
  },
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
    "ravitemer/codecompanion-history.nvim",
  },
}
