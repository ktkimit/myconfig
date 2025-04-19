local M = {
  "otavioschwanck/arrow.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
  },
  opts = {
    show_icons = true,
    leader_key = '.',   -- Recommended to be a single key
    buffer_leader_key = '<C-.>', -- Per Buffer Mappings
  }
}

return M
