--package management
require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'morhetz/gruvbox'
end)

--color settings
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd.colorscheme("gruvbox")

--line numbers
vim.opt.number = true
vim.opt.relativenumber = true

--shift and tab width settings
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
