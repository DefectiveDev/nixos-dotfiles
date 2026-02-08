return {
    "https://github.com/pwntester/octo.nvim.git",
    pin = true,
    cmd = "Octo",
    opts = {
        picker = "telescope",
        enable_builtin = true,
    },
    keys = {
        {
            "<leader>gi",
            "<CMD>Octo issue list<CR>",
            desc = "List [g]itHub [i]ssues (Octo)",
        },
        {
            "<leader>gp",
            "<CMD>Octo pr list<CR>",
            desc = "List [g]itHub [p]ullRequests (Octo)",
        },
        {
            "<leader>gd",
            "<CMD>Octo discussion list<CR>",
            desc = "List [g]itHub [d]iscussions (Octo)",
        },
        {
            "<leader>gn",
            "<CMD>Octo notification list<CR>",
            desc = "List [g]itHub [n]otifications (Octo)",
        },
        {
            "<leader>gs",
            function()
                require("octo.utils").create_base_search_command { include_current_repo = true }
            end,
            desc = "[g]itHub [s]earch (Octo)",
        },
    },
    specs = {
        {
            "https://github.com/saghen/blink.cmp.git",
            opts = {
                sources = {
                    per_filetype = {
                        octo = { inherit_defaults = true, "git" }
                    },
                    providers = {
                        git = {
                            module = "blink-cmp-git",
                            name = "Git",
                            opts = {
                                -- options for the blink-cmp-git
                            },
                        },
                    }
                }
            }
        },
        {
            "Kaiser-Yang/blink-cmp-git",
            pin = true,
            -- normally blink cmp will force this to load without the event activation
            event = { "InsertEnter octo" }
        }
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "nvim-tree/nvim-web-devicons",
    },
}
