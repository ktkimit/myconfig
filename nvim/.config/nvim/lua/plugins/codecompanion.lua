return {
  "olimorris/codecompanion.nvim",
  version = "^19.2.0",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      "zbirenbaum/copilot.lua",
      opts = {}
    },
    "ravitemer/codecompanion-history.nvim",
  },

  keys = {
    { "<C-a>", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, noremap = true, silent = true },
    { "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, noremap = true, silent = true },
    { "ga", "<cmd>CodeCompanionChat Add<cr>", mode = "v", noremap = true, silent = true },
  },

  opts = {
    extensions = {
      history = {
        opts = {
          auto_save = false,
          save_chat_keymap = "<LocalLeader>s",
          picker = "fzf-lua",
          picker_keymaps = {
            delete = { n = "d", i = "<M-q>" },
          },
        }
      }
    },
  },
}
