-- ~/.config/nvim/lua/plugins/homepage.lua

return {
    "WrongNicholas/homepage",
    lazy = false,  -- Load immediately
    priority = 1000,  -- Ensure it loads first
    config = function()
        require("homepage").setup()
    end,
}
