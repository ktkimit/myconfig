local M = {
  "cbochs/grapple.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", lazy = true }
  },
  opts = {
    scope = "git_branch",
  },
  event = { "BufReadPost", "BufNewFile" },
  cmd = "Grapple",
  keys = {
    { "fa", "<cmd>Grapple toggle<cr>",          desc = "Grapple toggle tag" },
    { "fe", "<cmd>Grapple toggle_tags<cr>",     desc = "Grapple open tags window" },
    { "fn", "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
    { "fp", "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple cycle previous tag" },
  },
}

return M
