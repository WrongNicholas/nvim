-- ~/.config/nvim/lua/plugins/notify.lua

return {
  {
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
    end,
  },
}
