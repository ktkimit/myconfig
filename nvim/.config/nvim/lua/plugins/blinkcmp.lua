local M = {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets' },

  version = '1.*',
  opts = {
    keymap = {
      ["<Tab>"] = { "select_next", "fallback_to_mappings" },
      ["<S-Tab>"] = { "select_prev", "fallback_to_mappings" },
      ['<C-n>'] = { 'snippet_forward', 'fallback' },
      ['<C-p>'] = { 'snippet_backward', 'fallback' },
    }
  }
}

return M
