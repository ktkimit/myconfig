if vim.g.vscode then
  -- VSCode extension
else
  -- plugins
  require('lazy-configure')

  -- settings
  require('settings')

  -- keymappings
  require('keymappings')
end
