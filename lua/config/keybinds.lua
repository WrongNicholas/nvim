-- ~/.config/nvim/lua/config/keybinds.lua

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set({"n", "v"}, "<leader>wn", ":s/\\\\n/\\r/g<CR>", { desc = "Wrap on literal \\n" })
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>q', ':q!<CR>', { desc = 'Quit window' })
vim.keymap.set('n', '<leader>\\', ':vsplit<CR>', { desc = 'Vertical Split' })
vim.keymap.set('n', '<leader>=', ':split<CR>', { desc = 'Horizontal Split' })
