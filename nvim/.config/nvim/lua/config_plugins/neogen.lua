local status_ok, neogen = pcall(require, "neogen")
if not status_ok then
  return
end

neogen.setup {
  enabled = true,
  snippet_engine = 'luasnip',
  languages = {
    python = {
      template = {
        annotation_convention = "reST"
      }
    }
  },
  snippet_engine = "luasnip",
}
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>nc", ":lua require('neogen').generate({ type = 'class' })<CR>", opts)

