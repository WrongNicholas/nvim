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
      map('n', '<A-h>', smart_splits.resize_left)
      map('n', '<A-j>', smart_splits.resize_down)
      map('n', '<A-k>', smart_splits.resize_up)
      map('n', '<A-l>', smart_splits.resize_right)

      -- Move between splits
      map('n', '<C-h>', smart_splits.move_cursor_left)
      map('n', '<C-j>', smart_splits.move_cursor_down)
      map('n', '<C-k>', smart_splits.move_cursor_up)
      map('n', '<C-l>', smart_splits.move_cursor_right)

      -- Swap buffers between splits
      map('n', '<leader><leader>h', smart_splits.swap_buf_left)
      map('n', '<leader><leader>j', smart_splits.swap_buf_down)
      map('n', '<leader><leader>k', smart_splits.swap_buf_up)
      map('n', '<leader><leader>l', smart_splits.swap_buf_right)
    end
  }
}

