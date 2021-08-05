-- map leader key to ,
vim.g.mapleader = ','

local fn = vim.fn
local execute = vim.api.nvim_command

require('settings')

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

require('plugins')

require('config.lsp')
require('config.completion')
