local M = {
  "LiadOz/nvim-dap-repl-highlights",
}

function M.config()
  local nvim_dap_repl_highlights = require('nvim-dap-repl-highlights')
  nvim_dap_repl_highlights.setup()
end

return M

