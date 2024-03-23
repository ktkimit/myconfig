local M = {
  "rcarriga/nvim-dap-ui",
  event = "VeryLazy",
  dependencies = {
    {
      "mfussenegger/nvim-dap",
      event = "VeryLazy",
    },
  },
}

function M.config()
  require("dapui").setup {}

  vim.keymap.set({'n', 'v'}, 'E', function()
    require("dapui").eval()
  end)

end

return M
