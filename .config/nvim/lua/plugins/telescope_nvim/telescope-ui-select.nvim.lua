return {
    "https://github.com/nvim-telescope/telescope-ui-select.nvim.git",
    pin = true,
    lazy = true,
    dependencies = { "https://github.com/nvim-telescope/telescope.nvim.git" },
    specs = {
        "https://github.com/nvim-telescope/telescope.nvim.git",
        opts = {
            extensions = {
                ["ui-select"] = {
                    function () require("telescope.themes").get_dropdown() end,
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
