return {
    "https://github.com/numToStr/Comment.nvim.git",
    pin = true,
    -- TODO: do similar plug method as nvim-surround for custom keymap descriptions.
    keys = {
        { "gc", mode = { 'x', 'n' }, desc = "+Comment toggle linewise"},
        { "gb", mode = { 'x', 'n' }, desc = "+Comment toggle blockwise" },
    },
    config = true,
}
