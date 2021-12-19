local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

vim.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 1,
}

vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "",
    staged = "S",
    unmerged = "",
    deleted = "",
    untracked = "U",
    ignored = "◌",
  },
  folder = {
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
  }
}

vim.g.nvim_tree_respect_buf_cwd = 1

require'nvim-tree'.setup {
  auto_close = true,
  update_cwd = true,
  ignore_ft_on_setup = {
    "alpha",
  },
  update_focused_file = {
    enable = true,
    update_cwd = true
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
}
