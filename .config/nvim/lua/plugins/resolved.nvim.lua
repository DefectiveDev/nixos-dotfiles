return {
    "https://github.com/noamsto/resolved.nvim.git",
    lazy = true,
    opts = {},
    specs = {
        {
            "https://github.com/folke/todo-comments.nvim.git",
            opts = function (_, opts)
                    require("lazy").load({ plugins = { "resolved.nvim" } })
                return opts
            end
        },
    }
}
