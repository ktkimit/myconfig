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
-- local hover = null_ls.builtins.hover

-- completion sources
local completion = null_ls.builtins.completion

-- register any number of sources simultaneously
local sources = {
  -- c, cpp

  -- python
  diagnostics.flake8,
  diagnostics.pydocstyle,
  formatting.black,
  -- tex, markdown
  code_actions.proselint,
  diagnostics.proselint
}

null_ls.setup({
  diagnostics_format = "[#{c}] #{m} (#{s})",
  sources = sources,
})
