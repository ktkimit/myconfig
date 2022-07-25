local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end


treesitter.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

  refactor = {
    highlight_definitions = {
      enable = true,
      -- Set to false if you have an `updatetime` of ~100.
      clear_on_cursor_move = true,
    },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "gR",
      },
    },
  },
}

-- treesitter.setup {
--   highlight = {
--     enable = true,
--     custom_captures = {
--       -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
--       ["foo.bar"] = "Identifier",
--     },
--     -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
--     -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
--     -- Using this option may slow down your editor, and you may see some duplicate highlights.
--     -- Instead of true it can also be a list of languages
--     additional_vim_regex_highlighting = false,
--   },
--   incremental_selection = {
--     enable = true,
--     keymaps = {
--       init_selection = "gnn",
--       node_incremental = "gni",
--       scope_incremental = "gnc",
--       node_decremental = "gnd",
--     },
--   },
--   indent = {
--     enable = true,
--     disable = {"python"}
--   },
--   refactor = {
--     highlight_definitions = {
--       enable = true,
--       -- Set to false if you have an `updatetime` of ~100.
--       clear_on_cursor_move = true,
--     },
--     smart_rename = {
--       enable = true,
--       keymaps = {
--         smart_rename = "gR",
--       },
--     },
--     navigation = {
--       enable = true,
--       keymaps = {
--         goto_definition = "gnd",
--         -- list_definitions = "gnD",
--         -- list_definitions_toc = "gO",
--         goto_next_usage = "<a-*>",
--         goto_previous_usage = "<a-#>",
--       },
--     },
--   }
-- }
