-- ~/.config/nvim/lua/plugins/colorscheme.lua

-- return {
--   {
--     "folke/tokyonight.nvim",
--     lazy = false, 
--     priority = 1000,
--     config = function()
--       vim.cmd([[colorscheme tokyonight-night]])
--     end,
--   },
-- }

-- return {
--   {
--     "bluz71/vim-moonfly-colors",
--     name = "moonfly",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       vim.cmd([[colorscheme moonfly]])
--     end,
--   }
-- }

return {
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme nightfly]])
    end,
  },
}

-- return {
--   {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     priority = 1000,
--     config = function()
--       vim.cmd([[colorscheme catppuccin]])
--     end,
--   }
-- }
