return {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        diagnosticMode = "workspace",
      },
    },
    on_attach = {
      vim.keymap.set('n', '<space>i', "<cmd>PyrightOrganizeImports<CR>", { desc = "Organize imports." }),
    }
  },

}
