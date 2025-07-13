return {
  settings = {
    on_attach = {
      vim.keymap.set('n', '<space>a', "<cmd>LspClangdSwitchSourceHeader<CR>", { desc = "Switch source and header." }),
      vim.keymap.set('n', '<space>s', "<cmd>LspClangdShowSymbolInfo<CR>", { desc = "Show symbol info." }),
    }
  }
}
