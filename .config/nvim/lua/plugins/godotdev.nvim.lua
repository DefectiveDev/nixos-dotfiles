return {
    "https://github.com/Mathijs-Bakker/godotdev.nvim.git",
    dependencies = { 'https://github.com/mfussenegger/nvim-dap.git', 'https://github.com/rcarriga/nvim-dap-ui.git', 'https://github.com/nvim-treesitter/nvim-treesitter.git' },
    opts = {
        editor_host = "127.0.0.1", -- Godot editor host
        editor_port = 6005,        -- Godot LSP port
        debug_port = 6006,         -- Godot debugger port
        godot_path = "godot",      -- executable used by :GodotRun* and health checks
        csharp = true,             -- Enable C# Installation Support
        autostart_editor_server = false, -- opt-in: start a Neovim server automatically on setup
        formatter = false,    -- "gdscript-formatter" | "gdformat" | false
        formatter_cmd = nil,       -- string or argv list; default gdscript-formatter adds "--reorder-code"
        inline_hints = {
            enabled = false,         -- enable Neovim inlay hints when the attached server supports them
        },
        run = {
            console = {
                enabled = false,       -- capture :GodotRun* output in Neovim; these runs are no longer detached
                renderer = "buffer",   -- "buffer" | "float"
                buffer = {
                    position = "bottom", -- "right" | "bottom" | "current"
                    size = 0.3,
                },
                float = {
                    width = 0.8,
                    height = 0.25,
                    border = "rounded",
                },
            },
        },
        scene_tree = {
            buffer = {
                position = "left",     -- "left" | "right"
                size = 0.35,
            },
            icons = "nerdfont",      -- "nerdfont" | "ascii" | false | { generic = "...", script_suffix = "...", types = { Node2D = "..." } }
            icon_colors = {
                generic = { fg = "white" },
                groups = {
                    White = { fg = "white" },
                    Grey = { fg = "grey" },
                    Blue = { fg = "blue" },
                    Red = { fg = "red" },
                    Green = { fg = "green" },
                    Purple = { fg = "magenta" },
                    Yellow = { fg = "gold" },
                },
            },
        },
        editor_server = {
            address = nil,           -- nil uses the current server or the platform default
            remove_stale_socket = true,
        },
        treesitter = {
            auto_setup = true,       -- convenience default; disable if you manage nvim-treesitter yourself
            ensure_installed = { "gdscript" },
        },
        docs = {
            renderer = "float",      -- default: open docs in a floating window
            fallback_renderer = "browser", -- nil | "browser" | "buffer"; browser is the only fetch-recovery fallback
            missing_symbol_feedback = "message", -- "message" | "notify"
            version = "stable",      -- e.g. "stable", "latest", "4.5"
            language = "en",
            source_ref = "master",   -- godot-docs git ref used for floating docs
            source_base_url = nil,   -- optional override for raw docs source
            timeout_ms = 10000,
            cache = {
                enabled = true,
                max_entries = 64,
            },
            float = {
                position = "center",
                width = 1,
                height = 1,
                border = nil
            },
            buffer = {
                position = "bottom",    -- "right" | "bottom" | "current"
                size = 1,
            },
        },
    },
    config = function (_, opts)
        require("godotdev").setup(opts)
        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("GodotDocs", {}),
            desc = "Godot Docs Keybind",
            pattern = "gdscript",
            callback = function()
        vim.keymap.set("n", "<localleader>gd", "<cmd>GodotDocs<cr>", { desc = "Godot docs" })
            end,
        })
    end
}
