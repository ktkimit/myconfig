local M = {
  'kevinhwang91/nvim-ufo',
  dependencies = {
    'kevinhwang91/promise-async',
    dependencies = {
      "luukvbaal/statuscol.nvim",
      opts = function()
        local builtin = require('statuscol.builtin')
        return {
          relculright = true,
          segments = {
            { text = { builtin.foldfunc }, click = 'v:lua.ScFa' },
            { text = { '%s' },             click = 'v:lua.ScSa' },
            { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
          },
        }
      end
    }
  },
}

function M.opts()
  -- vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
  vim.o.foldcolumn = '1'
  vim.o.foldlevel = 99
  vim.o.foldlevelstart = 99
  vim.o.foldenable = true

  vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = "require('ufo').openAllFolds" })
  vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = "require('ufo').closeAllFolds" })
  vim.keymap.set('n', 'zK', function()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if not winid then
      vim.lsp.buf.hover()
    end
  end, { desc = "Peek fold" })

  return {}
end

return M
