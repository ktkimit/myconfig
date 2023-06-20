local M = {
  "ggandor/leap.nvim",
  event = "VeryLazy",
}

function M.config()
  require('leap').add_default_mappings()
  vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
end

return M
