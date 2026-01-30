return {
    "smjonas/live-command.nvim",
    main = "live-command",
    opts = function ()
        vim.cmd("cnoreabbrev norm Norm")
        vim.cmd("cnoreabbrev exe Exe")
        vim.keymap.set({"n"}, "<leader>;", ":Exe \"\"<left>")
        vim.keymap.set({"x"}, "<leader>;", ":<home>Exe \"<end>\"<left>")
        return {
            commands = {
                Norm = { cmd = "norm!" },
                Exe = { cmd = "exe"},
            },
        }
    end
    ,
}
