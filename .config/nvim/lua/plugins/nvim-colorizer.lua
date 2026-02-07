return {
    "https://github.com/catgoose/nvim-colorizer.lua.git",
    pin = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        filetypes = {
            -- include everything else
            "*",
            noice = {
                rgb_fn = true,
                always_update = true,
            },
            [ "blink-cmp-menu" ] = {
                rgb_fn = true,
                always_update = true,
            },
            ["blink-cmp-signature"] = {
                rgb_fn = true,
                always_update = true,
            },
            ["blink-cmp-documentation"] = {
                rgb_fn = true,
                always_update = true,
            },
            -- exclude these filetypes
            "!TelescopePrompt",
            "!lazy"
        },
        user_default_options = {
            names = false,
        },
    },
}
