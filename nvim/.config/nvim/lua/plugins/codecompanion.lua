return {
  "olimorris/codecompanion.nvim",
  version = "^18.6.0",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "zbirenbaum/copilot.lua",
    "ravitemer/codecompanion-history.nvim",
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
    vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true }),
    vim.keymap.set({ "n", "v" }, "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true }),
    vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
  },
}
