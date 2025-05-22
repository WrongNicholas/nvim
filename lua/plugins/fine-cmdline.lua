-- ~/.config/nvim/lua/plugins/fine-cmdline.lua

return {
  { "VonHeikemen/fine-cmdline.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    config = function()
      vim.keymap.set("n", ":", "<cmd>FineCmdline<CR>")
      require('fine-cmdline').setup({
        cmdline = {
          enable_keymaps = true,
          smart_history = true,
          prompt = ': '
        },
      })
    end,
  },
}
