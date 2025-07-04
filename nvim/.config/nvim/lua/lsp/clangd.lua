return {
  cmd = {
    "clangd",
    "--background-index",
    "--suggest-missing-includes",
    "--function-arg-placeholders",
  },
  settings = {
    on_attach = {
      vim.keymap.set('n', '<space>a', "<cmd>ClangdSwitchSourceHeader<CR>", { desc = "Switch source and header." }),
      vim.keymap.set('n', '<space>s', "<cmd>ClangdShowSymbolInfo<CR>", { desc = "Show symbol info." }),
      vim.lsp.inlay_hint.enable(true)
    }
  }
}
