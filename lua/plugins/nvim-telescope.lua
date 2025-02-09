-- ~/.config/nvim/lua/plugins/telescope.lua

return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' },

      cmd = "Telescope",

      keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Live Grep" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "List Buffers" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>",  desc = "Help Tags" },
   },
  }
