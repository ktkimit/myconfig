local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- code action sources
local code_actions = null_ls.builtins.code_actions

-- diagnostic sources
local diagnostics = null_ls.builtins.diagnostics

-- formatting sources
local formatting = null_ls.builtins.formatting

-- hover sources
local hover = null_ls.builtins.hover

-- completion sources
local completion = null_ls.builtins.completion

-- register any number of sources simultaneously
local sources = {
  -- python
  diagnostics.flake8,
  diagnostics.pydocstyle,
  formatting.black,
  -- c, cpp
  -- diagnostics.clang-tidy,
  formatting.clang_format,
  -- tex, markdown
  code_actions.proselint,
  diagnostics.proselint
}

null_ls.setup({
  debug = false,
  diagnostics_format = "[#{c}] #{m} (#{s})",
  sources = sources,
})

vim.api.nvim_set_keymap('n', '<Leader>ff', '<cmd>lua vim.lsp.buf.formatting()<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>fs', '<cmd>lua vim.lsp.buf.formatting_sync()<CR>', {noremap=true, silent=true})

