return {
    "https://github.com/folke/snacks.nvim.git",
    opts = { notifier = { enabled = true } },
    specs = {
        "https://github.com/folke/noice.nvim.git",
        dependencies = { "https://github.com/folke/snacks.nvim.git", lazy = true }
    }
}
