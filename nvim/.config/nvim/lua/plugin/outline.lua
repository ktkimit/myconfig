local M = {
  "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  keys = { -- Example mapping to toggle outline
    { "<space>o", "<cmd>Outline<CR>",      desc = "Toggle outline" },
    { "<space>l", "<cmd>OutlineFocus<CR>", desc = "Toggle outline focus" },
  },
  opts = {
    -- Your setup opts here
  },
}

function M.config()
  require("outline").setup({
    keymaps = {
      goto_and_close = '<C-Cr>',
    }
  })
end

return M
