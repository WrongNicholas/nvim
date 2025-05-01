-- ~/.config/nvim/init.lua

require("config.options")
require("config.keybinds")
require("config.lazy")

vim.lsp.enable("cxx")
vim.lsp.enable("lua")
vim.lsp.enable("python")
