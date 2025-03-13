-- ~/.config/nvim/lua/config/options.lua

vim.o.wrap = false

vim.opt.signcolumn = "no"
vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.termguicolors = true

vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)
