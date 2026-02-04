return {
    "https://github.com/folke/snacks.nvim.git",
    -- TODO: add a seperate file for enabling, pinning, and any other related versioning configuration for snacks
    -- that will not be conditional
    --
    ---@type snacks.Config
    keys = { {"<leader>lg", function () Snacks.lazygit.open() end, desc = "Open [L]azy[G]it (Snacks)"} },
    opts = {
        lazygit = {
            enabled = true,
            win = {
                height = 0.99,
                width = 0.99
            }
        },
    },
}
