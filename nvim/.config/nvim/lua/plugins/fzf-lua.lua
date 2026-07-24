local M = {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

function M.opts()
  vim.keymap.set("n", "<Leader>ff", ":FzfLua files<CR>", { silent = true, desc = "FzfLua files" })
  vim.keymap.set("n", "<Leader>fo", ":FzfLua oldfiles<CR>", { silent = true, desc = "FzfLua oldfiles" })
  vim.keymap.set("n", "<Leader>fb", ":FzfLua buffers<CR>", { silent = true, desc = "FzfLua buffers" })
  vim.keymap.set("n", "<Leader>fg", ":FzfLua live_grep<CR>", { silent = true, desc = "FzfLua live_grep" })
  vim.keymap.set("n", "<leader>fr", ":FzfLua lsp_references<CR>", { silent = true, desc = "FzfLua lsp_references" })
  vim.keymap.set("n", "<leader>fd", ":FzfLua lsp_definitions<CR>", { silent = true, desc = "FzfLua lsp_definitions" })
  vim.keymap.set("n", "<Leader>fp", ":FzfLua grep_project<CR>", { silent = true, desc = "FzfLua grep_project" })
  vim.keymap.set("n", "<Leader>fs", ":FzfLua git_status<CR>", { silent = true, desc = "FzfLua git_status" })
  vim.keymap.set("n", "<Leader>fm", ":FzfLua marks<CR>", { silent = true, desc = "FzfLua marks" })
  vim.keymap.set("n", "<F1>", ":FzfLua help_tags<CR>", { silent = true, desc = "FzfLua help_tags" })

  -- Directory-scoped variants: prompt for a directory, then limit the
  -- search (files / live_grep) to that directory and its children.
  local fzf = require("fzf-lua")

  local function scoped(picker)
    return function()
      vim.ui.input({
        prompt = "Search dir: ",
        default = vim.fn.expand("%:p:h"), -- default to current file's dir
        completion = "dir",
      }, function(dir)
        if not dir or dir == "" then
          return
        end
        dir = vim.fn.fnamemodify(vim.fn.expand(dir), ":p")
        if vim.fn.isdirectory(dir) == 0 then
          vim.notify("Not a directory: " .. dir, vim.log.levels.ERROR)
          return
        end
        fzf[picker]({ cwd = dir })
      end)
    end
  end

  vim.keymap.set("n", "<Leader>fF", scoped("files"),
    { silent = true, desc = "FzfLua files (in dir)" })
  vim.keymap.set("n", "<Leader>fG", scoped("live_grep"),
    { silent = true, desc = "FzfLua live_grep (in dir)" })

  return {}
end

return M
