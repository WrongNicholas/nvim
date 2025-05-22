-- ~/.config/nvim/lua/plugins/dap-python.lua

return {
  "mfussenegger/nvim-dap-python",
  dependencies = { "mfussenegger/nvim-dap" },
  config = function()
    require("dap-python").setup("python")
  end,
}
