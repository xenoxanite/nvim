vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 3

vim.o.title = false
vim.o.showmode = false

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.wrap = false

vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2

vim.o.clipboard = "unnamedplus"
vim.o.autoread = true
vim.o.mouse = ""
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.undofile = true
vim.o.swapfile = false
-- vim.o.cursorline = true

vim.o.scrolloff = 999

vim.o.virtualedit = "block"

vim.o.inccommand = "split"

vim.o.termguicolors = true
vim.o.laststatus = 0

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.foldmethod = "expr"
-- vim.o.foldclose = "all"
vim.o.foldlevel = 20
-- vim.o.foldlevelstart = 0
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
