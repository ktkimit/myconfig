local M = {
  "sindrets/diffview.nvim",
  keys = {
    {"<leader>dc", "<cmd>DiffviewClose<cr>", desc="DiffviewClose"}
  },
}

function M.opts()
  -- Usage: :RegDiff [{register_1} {register_2}]
  -- If no registers are supplied: defaults to `+` and `*`.
  vim.api.nvim_create_user_command("DiffReg", function(ctx)
    local reg1, reg2

    if #ctx.fargs == 0 then
      -- If no args given: default to + and * registers
      reg1, reg2 = "+", "*"
    elseif #ctx.fargs < 2 then
      vim.notify("Inusfficient number of registers supplied! Needs two.", vim.log.levels.ERROR, {})
      return
    else
      -- Get registers from the given args
      reg1, reg2 = ctx.fargs[1], ctx.fargs[2]
    end

    local reg1_lines = vim.fn.getreg(reg1, 0, true) --[[@as string[] ]]
    local reg2_lines = vim.fn.getreg(reg2, 0, true) --[[@as string[] ]]

    vim.cmd("tabnew")
    local reg1_bufnr = vim.api.nvim_get_current_buf()
    local reg1_name = vim.fn.tempname() .. "/Register " .. reg1
    vim.api.nvim_buf_set_name(0, reg1_name)
    vim.bo.buftype = "nofile"
    vim.bo.swapfile = false
    vim.api.nvim_buf_set_lines(reg1_bufnr, 0, -1, false, reg1_lines)

    vim.cmd("enew")
    local reg2_bufnr = vim.api.nvim_get_current_buf()
    local reg2_name = vim.fn.tempname() .. "/Register " .. reg2
    vim.api.nvim_buf_set_name(0, reg2_name)
    vim.bo.buftype = "nofile"
    vim.bo.swapfile = false
    vim.api.nvim_buf_set_lines(reg2_bufnr, 0, -1, false, reg2_lines)

    vim.cmd("aboveleft diffsplit " .. vim.fn.fnameescape(reg1_name))
    vim.cmd("wincmd p")

    -- Wipe both register buffers when their last window closes,
    -- so :q / :tabclose tears the whole tab down cleanly.
    vim.bo[reg1_bufnr].bufhidden = "wipe"
    vim.bo[reg2_bufnr].bufhidden = "wipe"

    -- Closing either diff window should close the whole tab.
    local tabnr = vim.api.nvim_get_current_tabpage()
    local group = vim.api.nvim_create_augroup("DiffRegClose_" .. tabnr, { clear = true })
    vim.api.nvim_create_autocmd("WinClosed", {
      group = group,
      callback = function(args)
        local closed_win = tonumber(args.match)
        if not closed_win then return end
        -- Only act if the closed window was in our diff tab.
        if not vim.api.nvim_tabpage_is_valid(tabnr) then
          vim.api.nvim_del_augroup_by_id(group)
          return
        end
        local wins = vim.api.nvim_tabpage_list_wins(tabnr)
        local was_ours = false
        for _, w in ipairs(wins) do
          if w == closed_win then was_ours = true break end
        end
        if not was_ours then return end
        -- Defer so we don't close the tab while WinClosed is mid-flight.
        vim.schedule(function()
          if vim.api.nvim_tabpage_is_valid(tabnr) then
            pcall(vim.cmd, "tabclose " .. vim.api.nvim_tabpage_get_number(tabnr))
          end
          pcall(vim.api.nvim_del_augroup_by_id, group)
        end)
      end,
    })
  end, { bar = true, nargs = "*" })
  return {}
end

return M
