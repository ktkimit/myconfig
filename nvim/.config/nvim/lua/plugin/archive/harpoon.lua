local M = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  commit = 'e76cb03',
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy"
}

function M.config()
  local harpoon = require("harpoon")

  harpoon.setup()

  vim.keymap.set("n", "fa", function() harpoon:list():add() end, { desc = "Add current file to harpoon list" })
  vim.keymap.set("n", "fe", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
    { desc = "Open harpoon list" })

  -- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
  -- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
  -- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
  -- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

  -- Toggle previous & next buffers stored within Harpoon list
  vim.keymap.set("n", "fp", function() harpoon:list():prev() end, { desc = "Go the previous marked file" })
  vim.keymap.set("n", "fn", function() harpoon:list():next() end, { desc = "Go the previous marked file" })
end

return M
