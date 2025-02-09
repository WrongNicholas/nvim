-- ~/.config/nvim/lua/plugins/homepage.lua

return {
    "WrongNicholas/motd.nvim",
    lazy = false,  -- Load immediately
    config = function()
        require("motd").show_motd()
    end,
}
