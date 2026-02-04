return {
    "https://github.com/numToStr/Comment.nvim.git",
    pin = true,
    keys = {
        { "gc", mode = { 'x', 'n' }, desc = "+Comment toggle linewise"},
        { "gb", mode = { 'x', 'n' }, desc = "+Comment toggle blockwise" },
    },
    config = true,
}
