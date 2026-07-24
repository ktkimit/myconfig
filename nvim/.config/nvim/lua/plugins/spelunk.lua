return {
  'EvWilson/spelunk.nvim',
  dependencies = {
    'ibhagwan/fzf-lua',
  },
  opts = {
    base_mappings = {
      -- Toggle the UI open/closed
      toggle = '<leader>mt',
      -- Add a bookmark to the current stack
      add = '<leader>ma',
      -- Delete current line's bookmark from the current stack
      delete = '<leader>md',
      -- Move to the next bookmark in the stack
      next_bookmark = '<leader>mn',
      -- Move to the previous bookmark in the stack
      prev_bookmark = '<leader>mp',
      -- Fuzzy-find all bookmarks
      search_bookmarks = '<leader>mf',
      -- Fuzzy-find bookmarks in current stack
      search_current_bookmarks = '<leader>mc',
      -- Fuzzy find all stacks
      search_stacks = '<leader>ms',
      -- Change line of hovered bookmark
      change_line = "<leader>ml",
    },
    enable_persist = true,
    persist_by_git_branch = true,
    fuzzy_search_provider = 'fzf-lua',
  }
}
