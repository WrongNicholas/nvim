return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<F5>", function() require("dap").continue() end,          desc = "Continue", },
      { "<F9>", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint", },
      {
        "<F10>",
        function()
          require("dap").step_over()
          vim.api.nvim_feedkeys("zz", "n", false)
        end,
        desc = "Step Over",
      },
      {
        "<F11>",
        function()
          require("dap").step_into()
          vim.cmd(":norm zz")
        end,
        desc = "Step In",
      },
      {
        "<S-F11>",
        function()
          require("dap").step_out()
          vim.cmd(":norm zz")
        end,
        desc = "Step Out",
      },
    },
    config = function()
      local dap = require("dap")

      -- Configure C/C++ debugging with lldb
      dap.adapters.lldb = {
        type = "executable",
        command = "lldb-dap", -- Ensure `lldb-dap` is in your PATH
        name = "lldb",
      }

      dap.configurations.c = {
        {
          name = "Launch",
          type = "lldb", -- Matches the adapter name
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {}, -- Pass arguments to the executable here
        },
      }

      dap.configurations.cpp = dap.configurations.c -- Use the same configuration for C++
    end,
  },

  -- Optional: nvim-dap-ui for better UI
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()

      -- Automatically open/close DAP UI on debugging start/stop
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  -- Optional: dap-virtual-text for inline variable display
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },

  -- Unit Testing
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required dependency
      "alfaix/neotest-gtest",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      local neotest = require("neotest")

      -- Setup neotest with GTest adapter
      neotest.setup({
        adapters = {
          require("neotest-gtest").setup({
            debug_adapter = "lldb",
            is_test_file = function(file_path)
              return file_path:lower():match("**test.cpp$")
            end,
          }),
        },
      })

      -- Keybindings for Neotest
--      vim.keymap.set("n", "<leader>tt", ":lua require('neotest').run.run()<CR>", { silent = true, noremap = true })
--      vim.keymap.set("n", "<leader>tf", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", { silent = true, noremap = true })
--      vim.keymap.set("n", "<leader>ts", ":lua require('neotest').summary.toggle()<CR>", { silent = true, noremap = true })
--      vim.keymap.set("n", "<leader>to", ":lua require('neotest').output.open()<CR>", { silent = true, noremap = true })
    end,

      keys = {
    { "<leader>tt", function() require("neotest").run.run() end, desc = "Run Nearest" },
    { "<leader>td", function() require("neotest").run.run({strategy = "dap"}) end, desc = "Debug Nearest Test" },
    { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File" },
    { "<leader>tD", function() require("neotest").run.run(vim.fn.expand("%"), {strategy = "dap"}) end, desc = "Debug File" },
    { "<leader>tT", function() require("neotest").run.run(vim.loop.cwd()) end, desc = "Run All Test Files" },
    { "<leader>te", function() require("neotest").summary.toggle() end, desc = "Toggle Summary" },
    { "<leader>tO", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output" },
    { "<leader>to", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel" },
    { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop" },
  },
 
  },

  -- TreeSitter (for test discovery)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdateSync" },
    opts = {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      auto_install = true,
      indent = { enable = false },
      incremental_selection = {
        enable = true,
      },
      ensure_installed = {
        "c",
        "cpp",
        "doxygen",
      },
    }
  }
}
