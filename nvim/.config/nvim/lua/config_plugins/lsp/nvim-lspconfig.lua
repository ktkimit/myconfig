local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  return
end

local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
  return
end


local function attach_navic(client, bufnr)
  vim.g.navic_silence = true
  local status_ok, navic = pcall(require, "nvim-navic")
  if not status_ok then
    return
  end

  navic.attach(client, bufnr)
end


-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)

  -- Show line diagnostics automatically in hover window
  -- vim.api.nvim_create_autocmd("CursorHold", {
  --   buffer = bufnr,
  --   callback = function()
  --     local opts = {
  --       focusable = false,
  --       close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
  --       -- border = 'rounded',
  --       source = 'always',
  --       -- prefix = ' ',
  --       scope = 'cursor',
  --     }
  --     vim.diagnostic.open_float(nil, opts)
  --   end
  -- })

  -- -- Highlight symbol under cursor
  -- -- vim.cmd [[
  -- --   hi! LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
  -- --   hi! LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
  -- --   hi! LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
  -- -- ]]
  -- if client.resolved_capabilities.document_highlight then
  --   vim.api.nvim_create_augroup('lsp_document_highlight', {
  --     clear = false
  --   })
  --   vim.api.nvim_clear_autocmds({
  --     buffer = bufnr,
  --     group = 'lsp_document_highlight',
  --   })
  --   vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
  --     group = 'lsp_document_highlight',
  --     buffer = bufnr,
  --     callback = vim.lsp.buf.document_highlight,
  --   })
  --   vim.api.nvim_create_autocmd('CursorMoved', {
  --     group = 'lsp_document_highlight',
  --     buffer = bufnr,
  --     callback = vim.lsp.buf.clear_references,
  --   })
  -- end

  attach_navic(client, bufnr)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

for _, server in ipairs(lsp_installer.get_installed_servers()) do
  lspconfig[server.name].setup{
    capabilities = capabilities,
  }
end

for _, server in ipairs(lsp_installer.get_installed_servers()) do
  opts = {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
  }
  
  if server.name == "jsonls" then
    local jsonls_opts = require("config_plugins.lsp.server_config.jsonls")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server.name == "yamlls" then
    local yamlls_opts = require("config_plugins.lsp.server_config.yamlls")
    opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
  end

  if server.name == "sumneko_lua" then
    local sumneko_lua_opts = require("config_plugins.lsp.server_config.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_lua_opts, opts)
  end

  if server.name == "pyright" then
    local pyright_opts = require("config_plugins.lsp.server_config.pyright")
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server.name == "clangd" then
    local clangd_opts = require("config_plugins.lsp.server_config.clangd")
    opts = vim.tbl_deep_extend("force", clangd_opts, opts)
  end

  if server.name == "fortls" then
    local fortls_opts = require("config_plugins.lsp.server_config.fortls")
    opts = vim.tbl_deep_extend("force", fortls_opts, opts)
  end

  if server.name == "texlab" then
    local texlab_opts = require("config_plugins.lsp.server_config.texlab")
    opts = vim.tbl_deep_extend("force", texlab_opts, opts)
  end

  if server.name == "ltex" then
    local ltex_opts = require("config_plugins.lsp.server_config.ltex")
    opts = vim.tbl_deep_extend("force", ltex_opts, opts)
  end

  if server.name == "cmake" then
    local cmake_opts = require("config_plugins.lsp.server_config.cmake")
    opts = vim.tbl_deep_extend("force", cmake_opts, opts)
  end


  lspconfig[server.name].setup(opts)
end


-- local lsp_installer_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
-- if not lsp_installer_ok then
--   return
-- end
--
-- lsp_installer.setup{
--   automatic_installation = true,
-- }
--
-- -- Mappings.
-- -- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- local opts = { noremap=true, silent=true }
-- vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
-- vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
--
-- -- Use an on_attach function to only map the following keys
-- -- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
--   -- Enable completion triggered by <c-x><c-o>
--   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--
--   -- Mappings.
--   -- See `:help vim.lsp.*` for documentation on any of the below functions
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
--
--   -- Find the clients capabilities
--   -- if client.resolved_capabilities.document_highlight then
--   --   vim.api.nvim_exec(
--   --   [[
--   --   augroup lsp_document_highlight
--   --   autocmd! * <buffer>
--   --   autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
--   --   autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--   --   augroup END
--   --   ]],
--   --   false
--   --   )
--   -- end
--
--   require("aerial").on_attach(client, bufnr)
-- end
--
-- -- Add additional capabilities supported by nvim-cmp
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
--
-- -- Use a loop to conveniently call 'setup' on multiple servers and
-- -- map buffer local keybindings when the language server attaches
-- local servers = { 'pyright' }
-- for _, lsp in pairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
-- end
--
-- lspconfig.texlab.setup{
--   settings = {
--     texlab = {
--       build = {
--         forwardSearchAfter = true,
--       },
--       forwardSearch = {
--         executable = "/Applications/Skim.app/Contents/SharedSupport/displayline",
--         args = {"-g", "%l", "%p", "%f"}
--       },
--     },
--   },
--   on_attach = on_attach,
--   capabilities = capabilities
-- }
--
-- lspconfig.ltex.setup{
-- }
--
-- lspconfig.clangd.setup{
--   root_dir = lspconfig.util.root_pattern(
--     '.clangd',
--     '.clang-tidy',
--     '.clang-format',
--     'compile_commands.json',
--     'compile_flags.txt',
--     'configure.ac',
--     '.git'
--   ),
--   on_attach = on_attach,
-- }
--
-- vim.diagnostic.config({
--   virtual_text = false,
--   signs = true,
--   underline = true,
--   update_in_insert = false,
--   severity_sort = false,
-- })
--
-- local signs = { Error = "", Warn = "", Hint = "", Info = "" }
-- for type, icon in pairs(signs) do
--   local hl = "DiagnosticSign" .. type
--   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end
