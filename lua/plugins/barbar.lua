-- ~/.config/nvim/lua/plugins/barbar.lua

return {
  {'romgrk/barbar.nvim',
    dependencies = {
      -- 'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
    },
    version = '^1.0.0',

    -- Keybindings
    vim.keymap.set("n", "<Tab>", ":BufferNext<CR>", { noremap = true, silent = true }),
    vim.keymap.set("n", "<S-Tab>", ":BufferPrevious<CR>", { noremap = true, silent = true }),
    vim.keymap.set("n", "<leader>x", ":BufferClose<CR>", { noremap = true, silent = true })
  },
}
