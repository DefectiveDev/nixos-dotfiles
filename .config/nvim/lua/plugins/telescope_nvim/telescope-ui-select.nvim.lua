return {
    "nvim-telescope/telescope-ui-select.nvim",
    lazy = true,
    dependencies = { "nvim-telescope/telescope.nvim" },
    specs = {
        "nvim-telescope/telescope.nvim",
        opts = {
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
            }
        }
    },
    init = function ()
        vim.ui.select = function(...)
            require("lazy").load({plugins = {"telescope-ui-select.nvim"}})
            return vim.ui.select(...)
        end
    end,
    config = function()
        require("telescope").load_extension("ui-select")
    end
}
