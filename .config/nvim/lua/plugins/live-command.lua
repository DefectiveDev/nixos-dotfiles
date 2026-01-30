return {
    "smjonas/live-command.nvim",
    main = "live-command",
    cmd = {
        "Norm",
        "Exe"
    },
    init = function ()
        vim.cmd("cnoreabbrev norm Norm")
        vim.cmd("cnoreabbrev exe Exe")
    end,
    keys = {
        {"<leader>;",  ":Exe \"\"<left>", mode = "n", desc = "Shortcut for Exe"},
        {"<leader>;",  ":<home>Exe \"<end>Norm \"<left>", mode = "x", desc = "Shortcut for Exe Norm with selection"}
    },
    opts = {
        commands = {
            Norm = { cmd = "norm!" },
            Exe = { cmd = "exe"},
        },
    }
}
