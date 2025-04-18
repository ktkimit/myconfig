local M = {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons"},
  -- dependencies = { "echasnovski/mini.icons" },
  opts = {}
}

function M.config()
  require("fzf-lua").setup({
  })
end

return M
