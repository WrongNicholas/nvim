-- ~/.config/nvim/lua/plugins/smart-splits.lua

return {
  {
    "mrjones2014/smart-splits.nvim",
    config = function()
      require("smart-splits").setup({})

      -- Keybindings
      local smart_splits = require("smart-splits")
      local map = vim.keymap.set

      -- Create splits
      map('n', '<leader>\\', function()
        vim.cmd(':vsplit')
        smart_splits.move_cursor_right()
      end, { desc = 'Vertical Split' })
      map('n', '<leader>=', function()
        vim.cmd('split')
        smart_splits.move_cursor_down()
      end, { desc = 'Horizontal Split' })

      -- Resize splits
      map('n', '<S-A-h>', smart_splits.resize_left)
      map('n', '<S-A-j>', smart_splits.resize_down)
      map('n', '<S-A-k>', smart_splits.resize_up)
      map('n', '<S-A-l>', smart_splits.resize_right)

      -- Move between splits
      map('n', '<C-h>', smart_splits.move_cursor_left)
      map('n', '<C-j>', smart_splits.move_cursor_down)
      map('n', '<C-k>', smart_splits.move_cursor_up)
      map('n', '<C-l>', smart_splits.move_cursor_right)

      -- Swap buffers between splits
      map('n', '<C-A-h>', smart_splits.swap_buf_left)
      map('n', '<C-A-j>', smart_splits.swap_buf_down)
      map('n', '<C-A-k>', smart_splits.swap_buf_up)
      map('n', '<C-A-l>', smart_splits.swap_buf_right)
    end
  }
}

