-- ~/.config/nvim/lua/plugins/nvim-notify.lua

return {
  {
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
    end,
  },
}
