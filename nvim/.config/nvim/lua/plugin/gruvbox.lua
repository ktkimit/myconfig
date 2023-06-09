local M = {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000
}

function M.config()
  local status_ok, _ = pcall(vim.cmd.colorscheme, "gruvbox")
  if not status_ok then
    return
  end

  require("gruvbox").setup({
    transparent_mode = true,
  })
end

return M
