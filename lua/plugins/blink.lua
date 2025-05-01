-- ~/.config/nvim/lua/plugins/cmp.lua

return {
    -- https://github.com/Saghen/blink.cmp
    "saghen/blink.cmp",
    enabled = not vim.g.vscode,
    version = "*",

    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = "enter", -- { "default", "super-tab" "enter" }
      },

      completion = {
        keyword = { range = "full" },
        -- Show documentation when selecting a completion item
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
        menu = { auto_show = true },
        ghost_text = { enabled = true },

      },

      appearance = {
        -- Useful for when your theme doesn't support blink.cmp
        use_nvim_cmp_as_default = true,
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = "mono",
      },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        -- Remove 'buffer' if you don't want text completions, by default it's only enabled when LSP returns no items
        default = { "lsp", "path", "snippets", }, --"buffer" },
        providers = {
          snippets = {
            opts = {
              search_paths = {
                vim.fn.getcwd() .. "/.vscode",
                vim.fn.stdpath("config") .. "/snippets",
              },
            },
          },
          markdown = {
            name = "RenderMarkdown",
            module = "render-markdown.integ.blink",
            fallbacks = { "lsp" },
          },
        },
      },

      signature = { enabled = true },
    },
    opts_extend = { "sources.default" },
}

-- return {
--   "hrsh7th/nvim-cmp",
--   dependencies = {
--     "hrsh7th/cmp-nvim-lsp",
--     "L3MON4D3/LuaSnip",
--     "saadparwaiz1/cmp_luasnip",
--   },
--   config = function()
--     local cmp = require("cmp")
--     local luasnip = require("luasnip")
--
--     cmp.setup({
--       snippet = {
--         expand = function(args)
--           luasnip.lsp_expand(args.body)
--         end,
--       },
--       mapping = {
--         ["<CR>"] = cmp.mapping.confirm({ select = true }),
--         ["<C-Space>"] = cmp.mapping.complete(),
--         ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
--         ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
--       },
--       sources = {
--         { name = "nvim_lsp" },
--         { name = "luasnip" },
--       },
--     })
--   end,
-- }
