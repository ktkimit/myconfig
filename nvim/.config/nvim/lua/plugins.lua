-- Automatically install packer
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Language serve protocol
  use 'williamboman/nvim-lsp-installer'
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('config_plugins.nvim-lspconfig')
    end
  }

  -- Autocompletion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      require('config_plugins.nvim-cmp')
    end
  }

  -- null-ls
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function()
      require("null-ls").setup({
        diagnostics_format = "[#{c}] #{m} (#{s})",
        sources = {
          require("null-ls").builtins.formatting.black,
          require("null-ls").builtins.diagnostics.flake8,
          require("null-ls").builtins.formatting.clang_format,
          require("null-ls").builtins.diagnostics.cppcheck,
          require("null-ls").builtins.formatting.latexindent,
          require("null-ls").builtins.diagnostics.chktex
        },
      })
      vim.api.nvim_set_keymap('n', '<Leader>ff', '<cmd>lua vim.lsp.buf.formatting()<CR>', {noremap=true, silent=true})
      vim.api.nvim_set_keymap('n', '<Leader>fs', '<cmd>lua vim.lsp.buf.formatting_sync()<CR>', {noremap=true, silent=true})
    end
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require('config_plugins.nvim-treesitter')
    end
  }

  -- Debug Adapter Protocol
  use {
    'mfussenegger/nvim-dap',
    config = function()
      require('config_plugins.dap')
    end
  }
  use { 
    "rcarriga/nvim-dap-ui", 
    requires = {"mfussenegger/nvim-dap"}, 
    config = function()
      require("dapui").setup()
      vim.api.nvim_set_keymap('n', '<Leader>du', ":lua require('dapui').toggle()<CR>", {noremap=true, silent=true})
      vim.api.nvim_set_keymap('v', '<Leader>de', ":lua require('dapui').eval()<CR>", {noremap=true, silent=true})
      vim.api.nvim_set_keymap('n', '<Leader>de', ":lua require('dapui').eval()<CR>", {noremap=true, silent=true})
    end
  }

   -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function()
      require('config_plugins.telescope')
    end
  }

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Whichkey
  use {
    "folke/which-key.nvim",
    config = function()
      require('config_plugins.which-key')
    end
  }

  -- Snippets
  use {
    'L3MON4D3/LuaSnip',
    config =function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end
  }

  use "rafamadriz/friendly-snippets"


  -- File explorer
  use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
      },
      config = function()
        require('config_plugins.nvim-tree')
      end
  }

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
      require('config_plugins.lualine')
    end
  }

  -- Bufferline
  use {
    'akinsho/bufferline.nvim',
    branch='main',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('config_plugins.bufferline')
    end
  }

  -- Color scheme
  use {
    'ktkimit/gruvbox.nvim',
    requires = {"rktjmp/lush.nvim"},
    config = function()
      vim.o.background = "dark"
      vim.g.gruvbox_transparent_bg = true
      vim.g.gruvbox_italic = true
      vim.cmd([[colorscheme gruvbox]])
      vim.cmd[[hi CursorLine guibg=#000000]]
    end
  }

  -- Autopairs
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('config_plugins.nvim-autopairs')
    end
  }

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('config_plugins.gitsigns')
    end
  }

  -- Comments
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- Indentation guide
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("indent_blankline").setup {
        show_end_of_line = true,
      }
      vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
      vim.g.indent_blankline_filetype_exclude = {
        "help",
        "alpha",
        "packer",
        "neogitstatus",
        "NvimTree",
        "Trouble",
      }
    end
  }

  -- Docstrings
  use {
    "danymat/neogen",
    requires = "nvim-treesitter/nvim-treesitter",
    config = function()
      require('neogen').setup {
        enabled = true,
        snippet_engine = 'luasnip',
        languages = {
          python = {
            template = {
              annotation_convention = "reST"
            }
          }
        }
      }
      local opts = { noremap = true, silent = true }
      vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)
      vim.api.nvim_set_keymap("n", "<Leader>nc", ":lua require('neogen').generate({ type = 'class' })<CR>", opts)
    end
  }

  -- LSP signature
  use {
    "ray-x/lsp_signature.nvim",
    config = function()
      require "lsp_signature".setup({
        hint_enable = false,
      })
    end
  }

  -- Diagnostics
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
     vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>",
     {silent = true, noremap = true}
     )
     vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>",
     {silent = true, noremap = true}
     )
     vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>",
     {silent = true, noremap = true}
     )
     vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
     {silent = true, noremap = true}
     )
     vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
     {silent = true, noremap = true}
     )
     vim.api.nvim_set_keymap("n", "<leader>xr", "<cmd>Trouble lsp_references<cr>",
     {silent = true, noremap = true}
     )
    end
  }

  -- Project management
  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
      }
      require('telescope').load_extension('projects')
    end
  }

  -- Markdown preview
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
  }

  -- Imporve buffer delete
  use {
    'ojroques/nvim-bufdel',
    config = function()
      vim.api.nvim_set_keymap('n', '<Leader>bb', '<cmd>BufDel<CR>', {noremap=true, silent=true})
    end
  }

  -- Todo comments
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end
  }

  -- Spell checker with with tree-sitter highlighting
  use {
    'lewis6991/spellsitter.nvim',
    config = function()
      require('spellsitter').setup()
    end
  }

  -- Greeter
  use {
    'goolord/alpha-nvim',
    config = function()
      require('config_plugins.alpha-nvim')
    end
  }

  -- Toggle terminal
  use {
    "akinsho/toggleterm.nvim",
    branch='main',
    config = function()
      require("config_plugins.toggleterm")
    end
  }

  -- Code outline
  use {
    'stevearc/aerial.nvim',
    config = function()
      require("aerial").setup({
        on_attach = function(bufnr)
          -- Toggle the aerial window with <leader>a
          vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>a', '<cmd>AerialToggle!<CR>', {})
          -- Jump forwards/backwards with '{' and '}'
          vim.api.nvim_buf_set_keymap(bufnr, 'n', '[a', '<cmd>AerialPrev<CR>', {})
          vim.api.nvim_buf_set_keymap(bufnr, 'n', ']a', '<cmd>AerialNext<CR>', {})
          -- Jump up the tree with '[[' or ']]'
          vim.api.nvim_buf_set_keymap(bufnr, 'n', '[[', '<cmd>AerialPrevUp<CR>', {})
          vim.api.nvim_buf_set_keymap(bufnr, 'n', ']]', '<cmd>AerialNextUp<CR>', {})
        end
      })
      -- vim.cmd[[hi AerialLine guifg=#cb4b16]]
    end
  }

  -- zk
  use {
    "mickael-menu/zk-nvim",
    config = function()
      vim.env.ZK_NOTEBOOK_DIR = "/Users/ktkim/mynotes"
      require("config_plugins.zk-nvim")
    end
  }

  -- Motion
  use 'ggandor/lightspeed.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end

  -- Goto preview
  use {
    'rmagatti/goto-preview',
    config = function()
      require('goto-preview').setup{
        default_mappings = true,
      }
    end
  }
end)
