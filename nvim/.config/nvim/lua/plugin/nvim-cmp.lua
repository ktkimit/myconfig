local M = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    {
      "hrsh7th/cmp-nvim-lsp",
    },
    {
      "hrsh7th/cmp-buffer",
    },
    {
      "hrsh7th/cmp-path",
    },
    {
      "hrsh7th/cmp-cmdline",
    },
    {
      "saadparwaiz1/cmp_luasnip",
    },
    {
      "L3MON4D3/LuaSnip",
      event = "InsertEnter",
      dependencies = {
        "rafamadriz/friendly-snippets",
      },
    },
    {
      "hrsh7th/cmp-nvim-lua",
    },
    {"kdheepak/cmp-latex-symbols"},
    {
      "danymat/neogen",
    },
    {"jmbuhr/otter.nvim"},
  },
  event = {
    "InsertEnter",
    "CmdlineEnter",
  },
}

function M.config()
  local cmp = require "cmp"
  local luasnip = require "luasnip"
  local neogen = require('neogen')

  require("luasnip/loaders/from_vscode").lazy_load()

  local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
  end

  local kind_icons = {
    Class = " ",
    Color = " ",
    Constant = "ﲀ ",
    Constructor = " ",
    Enum = "練",
    EnumMember = " ",
    Event = " ",
    Field = " ",
    File = "",
    Folder = " ",
    Function = " ",
    Interface = "",
    Keyword = " ",
    Method = " ",
    Module = "",
    Operator = "",
    Property = " ",
    Reference = " ",
    Snippet = " ",
    Struct = " ",
    Text = " ",
    TypeParameter = " ",
    Unit = "塞",
    Value = " ",
    Variable = " ",
  }

  cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = cmp.mapping.preset.insert {
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      },
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ["<CR>"] = cmp.mapping.confirm { select = true },
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif neogen.jumpable() then
          neogen.jump_next()
        elseif luasnip.expandable() then
          luasnip.expand()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif check_backspace() then
          fallback()
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif neogen.jumpable(true) then
          neogen.jump_prev()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
    },
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        vim_item.kind = kind_icons[vim_item.kind]
        vim_item.menu = ({
          nvim_lsp = "",
          nvim_lua = "",
          luasnip = "",
          buffer = "",
          path = "",
          emoji = "",
        })[entry.source.name]
        return vim_item
      end,
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
      { name = "latex_symbols",
        option = {
          strategy = 2,
        },
      },
      { name = "otter" },
    },
    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    experimental = {
      ghost_text = true,
    },
  }
end

return M

--local cmp_status_ok, cmp = pcall(require, "cmp")
--if not cmp_status_ok then
--  return
--end
--
--local snip_status_ok, luasnip = pcall(require, "luasnip")
--if not snip_status_ok then
--  return
--end
--
--local cmp_dictionary_status_ok, cmp_dictionary = pcall(require, "cmp_dictionary")
--if not cmp_dictionary_status_ok then
--  return
--end
--
--local has_words_before = function()
--  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
--end
--
--
--local kind_icons = {
--  Class = " ",
--  Color = " ",
--  Constant = "ﲀ ",
--  Constructor = " ",
--  Enum = "練",
--  EnumMember = " ",
--  Event = " ",
--  Field = " ",
--  File = "",
--  Folder = " ",
--  Function = " ",
--  Interface = "ﰮ ",
--  Keyword = " ",
--  Method = " ",
--  Module = " ",
--  Operator = "",
--  Property = " ",
--  Reference = " ",
--  Snippet = " ",
--  Struct = " ",
--  Text = " ",
--  TypeParameter = " ",
--  Unit = "塞",
--  Value = " ",
--  Variable = " ",
--}

--cmp.setup {
--  formatting = {
--    format = function(entry, vim_item)
--      -- Kind icons
--      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
--      -- Source
--      vim_item.menu = ({
--        buffer = "[Buffer]",
--        nvim_lsp = "[LSP]",
--        luasnip = "[LuaSnip]",
--        nvim_lua = "[Lua]",
--        latex_symbols = "[LaTeX]",
--        path = "[Path]",
--        dictionary = "[Dic]",
--      })[entry.source.name]
--      return vim_item
--    end
--  },
--  snippet = {
--    -- REQUIRED - you must specify a snippet engine
--    expand = function(args)
--      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
--    end,
--  },
--  window = {
--    completion = cmp.config.window.bordered(),
--    documentation = cmp.config.window.bordered(),
--  },
--  sources = cmp.config.sources({
--    { name = 'nvim_lsp' },
--    { name = 'luasnip' },
--  }, {
--      { name = 'buffer' },
--      { name = 'path'},
--    }, {
--      { name = "dictionary",
--        keyword_length = 2, }
--    }),
--  mapping = cmp.mapping.preset.insert({
--    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--    ['<C-f>'] = cmp.mapping.scroll_docs(4),
--    ['<C-Space>'] = cmp.mapping.complete(),
--    ['<C-e>'] = cmp.mapping.abort(),
--    ['<CR>'] = cmp.mapping.confirm({ select = true }),
--    ["<Tab>"] = cmp.mapping(function(fallback)
--      if cmp.visible() then
--        cmp.select_next_item()
--      elseif luasnip.expand_or_jumpable() then
--        luasnip.expand_or_jump()
--      elseif has_words_before() then
--        cmp.complete()
--      else
--        fallback()
--      end
--    end, { "i", "s" }),
--
--    ["<S-Tab>"] = cmp.mapping(function(fallback)
--      if cmp.visible() then
--        cmp.select_prev_item()
--      elseif luasnip.jumpable(-1) then
--        luasnip.jump(-1)
--      else
--        fallback()
--      end
--    end, { "i", "s" }),
--  }),
--
--  enabled = function()
--    return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
--        or require("cmp_dap").is_dap_buffer()
--  end
--}
--
---- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline('/', {
--  mapping = cmp.mapping.preset.cmdline(),
--  sources = {
--    { name = 'nvim_lsp_document_symbol' },
--    { name = 'buffer' }
--  }
--})
--
---- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline(':', {
--  mapping = cmp.mapping.preset.cmdline(),
--  sources = cmp.config.sources({
--    { name = 'path' }
--  }, {
--      { name = 'cmdline' },
--      { name = 'cmdline_history' },
--    }
--  )
--})
--
--cmp_dictionary.setup({
--  dic = {
--    ["*"] = { "/home/ktkim/.local/share/dict/american_english.dic" },
--  },
--
--  exact = 2,
--  first_case_insensitive = true,
--  document = true,
--  document_command = "wn %s -over",
--  async = true,
--  capacity = 5,
--  debug = false,
--})
--
--cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
--  sources = {
--    { name = "dap" },
--  },
--})
