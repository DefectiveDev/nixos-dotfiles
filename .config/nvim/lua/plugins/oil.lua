return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", },
    ---@module 'oil'
    ---@type oil.SetupOpts
    cmd = {"Oil"},
    keys = {{
        "-", "<CMD>Oil<CR>", desc= "Open parent directory (Oil)"
    }},
    opts = {
        view_options = {
            is_hidden_file = function(name, bufnr)
                return name ~= ".." and vim.startswith(name, ".")
            end,
        }
    },
    -- Optional dependencies
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    -- lazy = false,
}
