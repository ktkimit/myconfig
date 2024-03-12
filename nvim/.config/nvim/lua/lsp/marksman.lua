return{
  filetypes = {"markdown", "quarto"},
  root_dir = require("lspconfig.util").root_pattern(".git", ".marksman.toml", "_quarto.yml"),
}
