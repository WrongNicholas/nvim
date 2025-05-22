-- ~/.config/nvim/lua/plugins/neotest.lua

return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neotest/neotest-python",
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            dap = { justMyCode = false },
            runner = "pytest",
          }),
        },
      })

      -- Keybindings
      local neotest = require("neotest")
      vim.keymap.set("n", "<leader>tt", neotest.run.run, { desc = "Run Nearest Test" })
      vim.keymap.set("n", "<leader>to", function()
        neotest.output.open({ enter = false, auto_close = true })
      end, { desc = "Open Floating Output Panel" })
      vim.keymap.set("n", "<leader>tp", function()
        require("neotest").output_panel.toggle()
      end, { desc = "Toggle Output Split" })
      vim.keymap.set("n", "<leader>td", function()
        neotest.run.run({ strategy = "dap" })
      end, { desc = "Debug nearest test" })
    end,
  },
}
