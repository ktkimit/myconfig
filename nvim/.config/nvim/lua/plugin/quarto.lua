local M = {
 "quarto-dev/quarto-nvim",
  ft = { 'quarto' },
  dependencies = {
    { 'jmbuhr/otter.nvim' },
  }
}

function M.config()
  local quarto = require "quarto"
  quarto.setup()
end

return M
