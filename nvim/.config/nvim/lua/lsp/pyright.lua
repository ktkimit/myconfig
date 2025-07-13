return {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
      },
    },
    on_attach = {
      vim.keymap.set('n', '<space>i', "<cmd>LspPyrightOrganizeImports<CR>", { desc = "Organize imports." }),
    }
  },

}
