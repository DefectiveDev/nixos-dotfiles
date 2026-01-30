return {
    "smjonas/live-command.nvim",
    main = "live-command",
    cmd = {
        "Norm",
        "Exe"
    },
    init = function ()
        vim.cmd("cnoreabbrev norm norm!")
        vim.cmd("cnoreabbrev exe Exe")
    end,
    keys = {
        {"<leader>;",  ":Exe \"\"<left>", mode = "n", desc = "Shortcut for Exe"},
        {"<leader>;",  ":<home>Exe \"<end>norm! \"<left>", mode = "x", desc = "Shortcut for Exe norm! with selection"}
    },
    opts = {
        commands = {
            Norm = { cmd = "norm!" },
            Exe = { cmd = "exe"},
        },
    }
}
