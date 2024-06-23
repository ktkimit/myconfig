local M = {
  "chentoast/marks.nvim",
  event = "VeryLazy"
}

function M.config()
  local marks = require("marks")

  marks.setup()
end

return M
