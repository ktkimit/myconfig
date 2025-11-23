return{
  "saxon1964/neovim-tips",
  version = "*", -- Only update on tagged releases
  lazy = true,  -- Load only when keybinds are triggered
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  opts = {
    -- IMPORTANT: Daily tip DOES NOT WORK with lazy = true
    -- Reason: lazy = true loads plugin only when keybinds are triggered,
    --         but daily_tip needs plugin loaded at startup
    -- Solution: Keep daily_tip = 0 here, or use Option 2 below for daily tips
    daily_tip = 0,  -- 0 = off, 1 = once per day, 2 = every startup
  },
  keys = {
    { "<leader>to", ":NeovimTips<CR>", desc = "Neovim tips" },
  },
}
