--install packer.nvim if it's not already installed (taken from the Github README, credit to @Iron-E and @khuedoan there)
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

--package management
require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'morhetz/gruvbox'
	--if packer wasn't installed install all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
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
