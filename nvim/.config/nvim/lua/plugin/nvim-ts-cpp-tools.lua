local M = {
  "Badhi/nvim-treesitter-cpp-tools",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = true,
}

function M.config()
  require("nt-cpp-tools").setup({
    preview = {
      quit = 'q',
      accept = '<tab>'
    },
    header_extension = 'h',
    source_extension = 'cxx',
    -- custom_define_class_function_commands = {
    --   TSCppImplWrite = {
    --     output_handle = require 'nt-cpp-tools.output_handlers'.get_add_to_cpp()
    --   }
    -- }
  })
end

return M
