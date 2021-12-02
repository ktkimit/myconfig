return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Language serve protocol
  use 'williamboman/nvim-lsp-installer'
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('config_plugins.nvim-lsconfig')
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
   -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
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
      require('nvim-autopairs').setup{}
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
    'terrortylor/nvim-comment',
    config = function()
      require('nvim_comment').setup()
    end
  }

  -- Indentation guide
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("indent_blankline").setup {
        show_end_of_line = true,
      }
    end
  }

  -- Docstrings
  use {
    "danymat/neogen",
    requires = "nvim-treesitter/nvim-treesitter",
    config = function()
      require('neogen').setup {
        enabled = true
      }
      local opts = { noremap = true, silent = true }
      vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)
      vim.api.nvim_set_keymap("n", "<Leader>nc", ":lua require('neogen').generate({ type = 'class' })<CR>", opts)
    end
  }
end)
