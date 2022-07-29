local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local servers = {
  "jsonls",
  "yamlls",
  "sumneko_lua",
  "pyright",
  "clangd",
  "texlab",
  "ltex",
}

local settings = {
  -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer", "sumneko_lua" }
  -- This setting has no relation with the `automatic_installation` setting.
  ensure_installed = servers,
}


lsp_installer.setup(settings)
