-- ~/.config/nvim/lua/plugins/null-ls.lua

return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Formatters
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,

        -- Linters
        null_ls.builtins.diagnostics.flake8,
      },
    })
  end,
}
