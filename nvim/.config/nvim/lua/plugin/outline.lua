local M = {
  "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  keys = { -- Example mapping to toggle outline
    { "<space>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
  },
  opts = {
    -- Your setup opts here
  },
}

function M.config()
  require("outline").setup({})
end

return M
