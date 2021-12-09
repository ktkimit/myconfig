-- set global options
vim.o.number = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.cursorline = true
vim.o.colorcolumn = '80'
vim.o.swapfile = false
vim.o.writebackup = false
vim.o.undofile = true
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.updatetime = 300
vim.o.scrolloff = 8
vim.o.completeopt = 'menu,menuone,noselect'
vim.o.timeoutlen = 500
vim.o.signcolumn = 'yes'
vim.o.autochdir = true

-- set global variables
vim.g.tex_flavor = 'latex'

-- set through vim command
vim.cmd[[hi CursorLine guibg=#000000]]
