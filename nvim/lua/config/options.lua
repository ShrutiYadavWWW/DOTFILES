-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.clipboard = ''
vim.opt.expandtab = true
vim.opt.linebreak = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeoutlen = 400
vim.opt.undofile = true
vim.opt.updatetime = 100
vim.opt.wrap = true
vim.cmd([[
set path^=~/.vim/,~/.config/nvim/*,~/.config/*,~/.termux/**,~/novels,~/Projects/
set wildignore+=*node_modules/**
set listchars=trail:·
]])
-- Backups
vim.cmd([[set nobackup nowritebackup noswapfile]])
vim.cmd([[set undodir=~/.vim/nvim_undodir/]])
