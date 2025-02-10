-- ~/.config/nvim/lua/plugins/mason-lspconfig.lua

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup({
        ensure_installed = { "clangd", "rust_analyzer", "lua_ls" },
      })
      mason_lspconfig.setup_handlers({
        function (server_name)
          local lspconfig = require("lspconfig")

          local cmp_nvim_lsp = require("cmp_nvim_lsp")
          local capabilities = cmp_nvim_lsp.default_capabilities()

          local on_attach = function(client, bufnr)
            local opts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          end

          lspconfig[server_name].setup({
            on_attach = on_attach,
            capabilities = capabilities,
          })
        end,
      })
    end
  },
}

