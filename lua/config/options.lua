-- ~/.config/nvim/lua/config/options.lua
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.wrap = false
-- Keybinds
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>q', ':q!<CR>', { desc = 'Quit window' })

vim.opt.signcolumn = "no"
vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
