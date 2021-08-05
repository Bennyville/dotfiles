local o = vim.o;
local b = vim.bo;
local w = vim.wo;

local cmd = vim.cmd;

cmd 'syntax on';
cmd 'filetype plugin indent on';

b.expandtab = true;
w.number = true;
w.relativenumber = true;

