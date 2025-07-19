local M = {
  'rmagatti/auto-session',
  lazy = false,

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    allowed_dirs = { '~/dev/*', '~/devs/*' },
    bypass_save_filetypes = { 'alpha', 'dashboard' },
  }
}

return M
