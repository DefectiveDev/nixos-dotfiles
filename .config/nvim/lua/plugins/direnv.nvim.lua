return {
    "NotAShelf/direnv.nvim",
    event = {"BufReadPre", "BufNewFile"},
    -- enabled=false,
    -- commit = "ecd3bd4898f79689a3f5bf956877ea42c7b3072e",
    opts = {
        -- Path to the direnv executable
        bin = "direnv",

        -- Whether to automatically load direnv when entering a directory with .envrc
        autoload_direnv = true,

        -- Statusline integration
        statusline = {
            -- Enable statusline component
            enabled = true,
            -- Icon to display in statusline
            icon = "󱚟 ",
        },

        -- Keyboard mappings
        keybindings = {
            allow = false,
            deny = false,
            reload = false,
            edit = false,
        },

        -- Notification settings
        notifications = {
            -- Log level (vim.log.levels.INFO, ERROR, etc.)
            level = vim.log.levels.INFO,
            -- Don't show notifications during autoload
            silent_autoload = true,
        },
    },
    config = function (_, opts)
        require("direnv").setup(opts)
        vim.api.nvim_create_autocmd("User", {
            pattern = "DirenvLoaded",
            callback = function()
                vim.cmd[[ wa! ]]
                vim.cmd[[ e! ]]
            end,
        })
    end
}
