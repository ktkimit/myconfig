return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      "zbirenbaum/copilot.lua",
      opts = {},
    },
    "ravitemer/codecompanion-history.nvim",
  },

  cmd = { "CodeCompanion", "CodeCompanionActions", "CodeCompanionChat", "CodeCompanionCmd" },

  keys = {
    { "<C-a>", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "CodeCompanion Actions" },
    { "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "CodeCompanion Chat" },
    { "ga", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "CodeCompanion Add" },
  },

  config = function()
    require("codecompanion").setup({
      strategies = {
        chat = { adapter = "copilot" },
        inline = { adapter = "copilot" },
        cmd = { adapter = "copilot" },
      },
      adapters = {
        http = {
          copilot = function()
            return require("codecompanion.adapters").extend("copilot", {
              schema = {
                model = {
                  default = "claude-opus-4.8",
                },
              },
            })
          end,
        },
      },
      extensions = {
        history = {
          opts = {
            auto_save = false,
            save_chat_keymap = "<LocalLeader>s",
            picker = "fzf-lua",
            picker_keymaps = {
              delete = { n = "d", i = "<M-q>" },
            },
          },
        },
      },
    })
  end,
}
