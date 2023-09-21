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
        use 'neovim/nvim-lspconfig'
        use {
            'ms-jpq/coq_nvim', branch = 'coq', run = 'python3 -m coq deps'
        }
        use {
            'ms-jpq/coq.artifacts', branch = 'artifacts'
        }
        use {
            'ms-jpq/coq.thirdparty', branch = '3p'
        }
        use 'yuezk/vim-js'
        use 'maxmellon/vim-jsx-pretty'
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

--lsp setup
local lspconfig = require 'lspconfig'
vim.g.coq_settings = { auto_start = 'shut-up' } --autostart coq for autocompletion w/ lspconfig
local servers = {'eslint', 'html', 'cssls', 'jsonls'}
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup(require('coq').lsp_ensure_capabilities())
end
