return {
    "https://github.com/smjonas/live-command.nvim.git",
	pin = true,
    main = "live-command",
    cmd = {
        "Norm",
        "Exe"
    },
    -- init = function ()
    --     vim.cmd("cnoreabbrev norm norm!")
    --     vim.cmd("cnoreabbrev exe Exe")
    -- end,
    -- NOTE: you can use Exe "g/pattern/command" to execute on each line with that pattern.
    keys = {
        {"<leader>;",  ":Exe \"\"<left>", mode = "n", desc = "Shortcut for [;]Exe"},
        {"<leader>;",  ":<home>Exe \"<end>norm! \"<left>", mode = "x", desc = "Shortcut for [;]Exe norm! with selection"}
    },
    opts = {
        commands = {
            Norm = { cmd = "norm!" },
            Exe = { cmd = "exe"},
        },
    }
}
