-- ~/.config/nvim/lua/plugins/toggleterm.lua

return {
  {'akinsho/toggleterm.nvim',
  version = "*",
  opts = {
      size = 20,
      direction = "float",
      open_mapping = [[<C-\>]],
      float_opts = {
        border = "curved",
      },
    },

  },
}
