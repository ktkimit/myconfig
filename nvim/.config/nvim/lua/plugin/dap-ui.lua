local M = {
  "rcarriga/nvim-dap-ui",
  event = "VeryLazy",
  dependencies = {
    {
      "mfussenegger/nvim-dap",
      event = "VeryLazy",
    },
    {"nvim-neotest/nvim-nio"}
  },
}

function M.config()
  require("dapui").setup {}

  vim.keymap.set({'n'}, '<Leader>du', function()
    require("dapui").toggle()
  end, {desc="Toggle dapui"})

  vim.keymap.set({'n', 'v'}, 'E', function()
    require("dapui").eval()
  end, {desc="Evaluate variable"})

end

return M
