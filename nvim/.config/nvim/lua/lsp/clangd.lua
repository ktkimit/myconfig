return {
  cmd = {
    "clangd",
    "--background-index",
    "--suggest-missing-includes",
    "--function-arg-placeholders",
    "--offset-encoding=utf-16"
  },
  settings = {
    on_attach = {
      vim.keymap.set('n', '<space>a', "<cmd>ClangdSwitchSourceHeader<CR>"),
      vim.lsp.inlay_hint.enable(true)
    }
  }
}
