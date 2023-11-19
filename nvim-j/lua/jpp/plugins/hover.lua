return {

    {
        "lewis6991/hover.nvim",
        config = function()
            require("hover").setup{}
        end
    },
    {
        "soulis-1256/hoverhints.nvim",
        config = function()
            require("hoverhints").setup{}
        end
    }
}
