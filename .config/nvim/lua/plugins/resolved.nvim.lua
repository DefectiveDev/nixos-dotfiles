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
    },
    config = function (_, opts)
        require("resolved").setup(opts)
        vim.keymap.set("n", "<leader>fi",function() require("resolved.picker").show_issues_picker() end,
        {desc = "[f]ind GitHub [i]ssues in current repo (Resolved.nvim)"})
    end
}
