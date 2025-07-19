local M = {
  "lewis6991/gitsigns.nvim",
}

M.opts = {
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({ ']c', bang = true })
      else
        gitsigns.nav_hunk('next')
      end
    end, { desc = "gitsigns.nav_hunk('next')" })

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({ '[c', bang = true })
      else
        gitsigns.nav_hunk('prev')
      end
    end, { desc = "gitsigns.nav_hunk('prev')" })

    -- Actions
    map('n', '<leader>hs', gitsigns.stage_hunk, { desc = "gitsigns.stage_hunk" })
    map('n', '<leader>hr', gitsigns.reset_hunk, { desc = "gitsigns.reset_hunk" })

    map('v', '<leader>hs', function()
      gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, { desc = "gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })" })

    map('v', '<leader>hr', function()
      gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, { desc = "gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })" })

    map('n', '<leader>hS', gitsigns.stage_buffer, { desc = "gitsigns.stage_buffer" })
    map('n', '<leader>hR', gitsigns.reset_buffer, { desc = "gitsigns.reset_buffer" })
    map('n', '<leader>hp', gitsigns.preview_hunk, { desc = "gitsigns.preview_hunk" })
    map('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = "gitsigns.preview_hunk_inline" })

    map('n', '<leader>hb', function()
      gitsigns.blame_line({ full = true })
    end, { desc = "gitsigns.blame_line({ full = true }" })

    map('n', '<leader>hd', gitsigns.diffthis, { desc = "gitsigns.diffthis" })

    map('n', '<leader>hD', function()
      gitsigns.diffthis('~')
    end, { desc = "gitsigns.diffthis('~')" })

    map('n', '<leader>hQ', function() gitsigns.setqflist('all') end, { desc = "gitsigns.setqflist('all')" })
    map('n', '<leader>hq', gitsigns.setqflist, { desc = "gitsigns.setqflist" })

    -- Toggles
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = "gitsigns.toggle_current_line_blame" })
    map('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = "gitsigns.toggle_word_diff" })

    -- Text object
    map({ 'o', 'x' }, 'ih', gitsigns.select_hunk, { desc = "gitsigns.select_hunk" })
  end
}

return M
