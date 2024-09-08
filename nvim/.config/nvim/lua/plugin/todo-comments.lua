local M = {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  opts = {}
}

function M.config()
  require("todo-comments").setup()

  vim.keymap.set("n", "]t", function()
    require("todo-comments").jump_next()
  end, { desc = "Next todo comment" })

  vim.keymap.set("n", "[t", function()
    require("todo-comments").jump_prev()
  end, { desc = "Previous todo comment" })
end

return M
