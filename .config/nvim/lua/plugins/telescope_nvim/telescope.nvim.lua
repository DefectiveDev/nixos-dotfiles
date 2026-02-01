return {
    "nvim-telescope/telescope.nvim",
    tag = "v0.2.1",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make"},
        "nvim-tree/nvim-web-devicons",
    },
    cmd = "Telescope",
    keys = {
        {"<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Fuzzy find files in cwd (Telescope)"},
        {"<leader>fg", function() require("telescope.builtin").live_grep() end,  desc = "Find string in cwd (Telescope)"},
        {"<leader>fb", function() require("telescope.builtin").buffers() end,  desc = "Find buffer (Telescope)"},
        {"<leader>fh", function() require("telescope.builtin").builtin() end,  desc = "Find telescope builtin pickers (Telescope)"},
        {"<leader>fc", function() require("telescope.builtin").grep_string() end,  desc = "Find string under cursor in cwd (Telescope)"},
    },
    opts = function ()
        local actions = require("telescope.actions")

        return {
            defaults = {
                layout_config = {
                    -- This makes telescope take up entire screen
                    height = {
                        padding = 0,
                    },
                    width = {
                        padding = 0
                    }
                },
                prompt_prefix = " ",
                selection_caret = " ",
                -- border = false,
                preview = {
                    treesitter = false,
                },
                path_display = { "truncat "},
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next, -- move to next result
                        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                    },
                },
            },
            pickers = {
                find_files = {
                    -- If you want to ignore folder specific files use .ignore file using the same syntax as .gitignore
                    file_ignore_patterns = {'.git/', '.direnv/', 'flake.lock', '.uid', '.ttf'},
                    file_command = {'fd', '--type', 'f'},
                    hidden = true,
                },
            },
        }
    end,
    config = function(_, opts)
        require("telescope").setup(opts)
        local highlights = {}
        highlights.setup = function()
            local drac_colors = require("dracula").colors()
            local normal_hl = vim.api.nvim_get_hl_by_name('Normal', true)

            local preview_bg = drac_colors.bg
            local result_bg = drac_colors.menu
            local prompt_bg = drac_colors.black
            local prompt_fg_special = drac_colors.red
            local preview_special = drac_colors.purple
            local result_special = drac_colors.pink
            local result_selection = drac_colors.selection

            ----------------------------------------------------------------------
            --                              Prompt                              --
            ----------------------------------------------------------------------
            vim.api.nvim_set_hl(0, 'TelescopePromptBorder', {
                fg = prompt_bg,
                bg = prompt_bg
            })

            vim.api.nvim_set_hl(0, 'TelescopePromptNormal', {
                fg = normal_hl.foreground,
                bg = prompt_bg,
            })

            vim.api.nvim_set_hl(0, 'TelescopePromptTitle', {
                fg = normal_hl.foreground,
                bg = prompt_fg_special,
            })

            vim.api.nvim_set_hl(0, 'TelescopePromptCounter', {
                fg = prompt_fg_special,
                bg = prompt_bg,
            })

            vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', {
                fg = prompt_fg_special,
                bg = prompt_bg,
            })

            ----------------------------------------------------------------------
            --                              Result                              --
            ----------------------------------------------------------------------
            vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', {
                fg = result_bg,
                bg = result_bg,
            })

            vim.api.nvim_set_hl(0, 'TelescopeResultsNormal', {
                fg = normal_hl.foreground,
                bg = result_bg,
            })

            vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', {
                fg = normal_hl.foreground,
                bg = result_special,
            })

            vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', {
                fg = result_special,
                bg = result_selection,
            })

            ----------------------------------------------------------------------
            --                             Preview                              --
            ----------------------------------------------------------------------

            vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', {
                fg = preview_bg,
                bg = preview_bg,
            })

            vim.api.nvim_set_hl(0, 'TelescopePreviewNormal', {
                fg = normal_hl.foreground,
                bg = preview_bg,
            })

            vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', {
                fg = normal_hl.foreground,
                bg = preview_special,
            })

        end
        highlights.setup()
    end
}


