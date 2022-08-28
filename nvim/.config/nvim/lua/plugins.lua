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
  use "wbthomason/packer.nvim"

  -- To speed up neovim's starting time
  use {
    'lewis6991/impatient.nvim',
    config = function()
      require("impatient")
    end
  }
  use "nathom/filetype.nvim"

  -- Useful lua functions used by many plugins
  use "nvim-lua/plenary.nvim"

  -- Color scheme
  use {
    'ellisonleao/gruvbox.nvim',
    config = function()
      vim.o.background = "dark"
      vim.g.gruvbox_transparent_bg = 1
      vim.g.gruvbox_italic = 1
      vim.g.gruvbox_improved_strings = 1
      vim.g.gruvbox_improved_warnings = 1
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

  -- Comments
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('config_plugins.comment')
    end
  }

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
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('config_plugins.bufferline')
    end
  }

  -- Motion
  use 'ggandor/lightspeed.nvim'

  -- Toggle terminal
  use {
    "akinsho/toggleterm.nvim",
    config = function()
      require("config_plugins.toggleterm")
    end
  }

  -- Project management
  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require("config_plugins.project")
    end
  }

  -- Indentation guide
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("config_plugins.indent_blankline")
    end
  }

  -- Colorizer
  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("config_plugins.colorizer")
    end
  }
  
  -- use windwp/nvim-spectre

  -- better quickfix window
  use {'kevinhwang91/nvim-bqf', ft = 'qf'}

  -- -- File marks and navigate
  -- use {
  --   "ThePrimeagen/harpoon",
  --   config = function()
  --     require("config_plugins.harpoon")
  --   end
  -- }

  -- Markdown preview
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
  }

  -- A simple statusline/winbar component
  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
    config = function()
      require("config_plugins.navic")
    end
  }

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

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

  -- Greeter
  use {
    'goolord/alpha-nvim',
    config = function()
      require('config_plugins.alpha-nvim')
    end
  }

  -- Whichkey
  use {
    "folke/which-key.nvim",
    config = function()
      require('config_plugins.which-key')
    end
  }

  -- Todo comments
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup{}
    end
  }

  -- Language serve protocol
  use { 'neovim/nvim-lspconfig' }
  use { 'williamboman/nvim-lsp-installer' }

  -- LSP others
  use {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup{}
    end
  }
  use {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("config_plugins.lsp_signature")
    end
  }


  -- Autocompletion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      --
      'uga-rosa/cmp-dictionary',
      'hrsh7th/cmp-nvim-lsp-document-symbol',
      'dmitmel/cmp-cmdline-history',
      'rcarriga/cmp-dap',
    },
    config = function()
      require('config_plugins.nvim-cmp')
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

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require('config_plugins.nvim-treesitter')
    end
  }
  use "nvim-treesitter/nvim-treesitter-refactor"

   -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function()
      require('config_plugins.telescope')
    end
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- use "nvim-telescope/telescope-media-files.nvim"

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

  -- null-ls
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function()
      require('config_plugins.null-ls')
    end
  }

  -- Trouble
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("config_plugins.trouble")
    end
  }

  -- Docstrings
  use {
    "danymat/neogen",
    requires = "nvim-treesitter/nvim-treesitter",
    config = function()
      require('config_plugins.neogen')
    end
  }

  -- zk
  use {
    "mickael-menu/zk-nvim",
    config = function()
      vim.env.ZK_NOTEBOOK_DIR = "/home/ktkim/notes"
      require("config_plugins.zk-nvim")
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end

  -- use {"is0n/jaq-nvim"}

  -- -- Spell checker with with tree-sitter highlighting
  -- use {
  --   'lewis6991/spellsitter.nvim',
  --   config = function()
  --     require('spellsitter').setup({
  --       enable = true,
  --     })
  --   end
  -- }
  --
  -- -- Code outline
  -- use {
  --   'stevearc/aerial.nvim',
  --   config = function()
  --     require("aerial").setup({
  --       on_attach = function(bufnr)
  --         -- Toggle the aerial window with <leader>a
  --         vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>a', '<cmd>AerialToggle!<CR>', {})
  --         -- Jump forwards/backwards with '{' and '}'
  --         vim.api.nvim_buf_set_keymap(bufnr, 'n', '[a', '<cmd>AerialPrev<CR>', {})
  --         vim.api.nvim_buf_set_keymap(bufnr, 'n', ']a', '<cmd>AerialNext<CR>', {})
  --         -- Jump up the tree with '[[' or ']]'
  --         vim.api.nvim_buf_set_keymap(bufnr, 'n', '[[', '<cmd>AerialPrevUp<CR>', {})
  --         vim.api.nvim_buf_set_keymap(bufnr, 'n', ']]', '<cmd>AerialNextUp<CR>', {})
  --       end
  --     })
  --     -- vim.cmd[[hi AerialLine guifg=#cb4b16]]
  --   end
  -- }
  --
  -- -- Goto preview
  -- use {
  --   'rmagatti/goto-preview',
  --   config = function()
  --     require('goto-preview').setup{
  --       default_mappings = true,
  --     }
  --   end
  -- }
end)
