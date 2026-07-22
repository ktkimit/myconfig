local M = {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "dlyongemallo/diffview-plus.nvim",

    "folke/snacks.nvim",
  },
  opts = {
    -- Use snacks.nvim as the fuzzy-finder backend instead of fzf-lua.
    --
    -- Neogit's fzf-lua finder integration does not reliably invoke
    -- `on_select(nil)` when the picker is aborted with <Esc> on current
    -- fzf-lua versions (fzf-lua's `actions.act()` returns early on an empty
    -- selection). That leaves Neogit's `find_async` coroutine suspended and
    -- its global popup semaphore held, so the next popup action (e.g. a
    -- second `d` `r`) silently deadlocks and no popup appears.
    --
    -- The snacks picker calls `on_select(nil)` on abort, so it does not
    -- deadlock. fzf_lua is explicitly disabled here because Neogit's finder
    -- prefers it over snacks when both are available.
    integrations = {
      fzf_lua = false,
      snacks = true,
    },
  },
}

return M
