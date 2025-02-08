vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      -- No file or directory passed, open Telescope's file picker
      require("telescope.builtin").find_files()
    end
  end,
})


require("config.options")
require("config.lazy")
