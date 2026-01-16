return {
    settings = {
        Lua = {
            hint = { enable = true },
            diagnostics = {
                global = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                },
                checkThirdParty = false
            },
        },
    },
}
