local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

require'nvim-tree'.setup {
  update_cwd = true,
  respect_buf_cwd = true,
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
  actions = {
    open_file ={
      quit_on_open = true,
    }
  },
  renderer = {
    icons = {
      webdev_colors = true,
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
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
    }
  }
}
