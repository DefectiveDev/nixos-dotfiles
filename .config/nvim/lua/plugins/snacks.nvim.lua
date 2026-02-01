return {
    "folke/snacks.nvim",
    ---@type snacks.Config
    keys = { {"<leader>lg", function () require("snacks").lazygit.open() end} },
    opts = {
        lazygit = { enabled = true },
    },
}
