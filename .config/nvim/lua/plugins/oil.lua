return {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    cmd = {"Oil"},
    keys = {{
        "-", "<CMD>Oil<CR>", desc= "Open parent directory (Oil)"
    }},
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons", },
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    -- lazy = false,
}
