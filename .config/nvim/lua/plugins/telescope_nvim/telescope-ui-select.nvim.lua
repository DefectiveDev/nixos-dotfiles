return {
    "https://github.com/nvim-telescope/telescope-ui-select.nvim.git",
    pin = true,
    lazy = false,
    -- dependencies = { "https://github.com/nvim-telescope/telescope.nvim.git" },
    specs = {
        {
            "https://github.com/nvim-telescope/telescope.nvim.git",
            opts = {
                extensions = {
                    ["ui-select"] = {
                        border = true,
                        borderchars = {
                            preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                            prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
                            results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" }
                        },
                        layout_config = {
                            preview_cutoff = 1,
                            width = function (_, max_columns, _)
                                return math.min(max_columns, 80)
                            end,
                            height = function (_, _, max_lines)
                                return math.min(max_lines, 15)
                            end,
                        },
                        layout_strategy = "center",
                        results_title = false,
                        sorting_strategy = "ascending",
                        theme = "dropdown"
                    },
                }
            }
        },
    },
    init = function ()
        vim.ui.select = function(...)
            require("lazy").load({plugins = {"telescope.nvim"}})
            require("lazy").load({plugins = {"telescope-ui-select.nvim"}})
            return vim.ui.select(...)
        end
    end,
    config = function()
        require("telescope").load_extension("ui-select")
    end
}
