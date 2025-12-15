-- plugin manager
require("config.lazy")

--colors
vim.o.termguicolors = true
vim.o.background = "dark"
vim.cmd("colorscheme gruvbox")

-- set tab to 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- bufferline
require('bufferline').setup{}

-- lualine
require('lualine').setup {}

-- gitsigns
require('gitsigns').setup {}

-- mini pairs
require('mini.pairs').setup {}

-- mini ai
require('mini.ai').setup {}
