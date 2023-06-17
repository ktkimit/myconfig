local M = {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
}

M.opts = {
  signs = {
    add          = {hl = "GitSignsAdd", text = '▎' },
    change       = {hl = 'GitSignsChange', text = '▎' },
    delete       = {hl = 'GitSignsDelete', text = '_' },
    topdelete    = {hl = 'GitSignsTopDelete', text = '‾' },
    changedelete = {hl = 'GitSignsChange', text = '~' },
    untracked    = {hl = 'GitSignsUntracked', text = '┆' },
  },
}

return M
