-- ~/.config/nvim/lua/config/keybinds.lua

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

map({"n", "v"}, "<leader>wn", ":s/\\\\n/\\r/g<CR>", { desc = "Wrap on literal \\n" })
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>q", ":q!<CR>", { desc = "Quit window" })
map("n", "?", function()
  vim.diagnostic.open_float(nil, { focus = false })
end, { desc = "Show diagnostics under cursor" })
