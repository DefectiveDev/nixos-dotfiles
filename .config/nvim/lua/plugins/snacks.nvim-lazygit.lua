return {
    "folke/snacks.nvim",
    ---@type snacks.Config
    keys = { {"<leader>lg", function () Snacks.lazygit.open() end, desc = "Open [L]azy[G]it (Snacks)"} },
    opts = { lazygit = { enabled = true } },
}
