return {
    "https://github.com/nvim-telescope/telescope.nvim.git",
    tag = "v0.2.1",
    dependencies = {
        "https://github.com/nvim-lua/plenary.nvim.git",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make"},
        "https://github.com/nvim-tree/nvim-web-devicons.git",
    },
    cmd = "Telescope",
    keys = {
        {"<leader>ff", function() require("telescope.builtin").find_files() end, desc = "[f]ind [f]iles in cwd (Telescope)"},
        {"<leader>fs", function() require("telescope.builtin").live_grep() end,  desc = "[f]ind [s]tring in cwd (Telescope)"},
        {"<leader>fb", function() require("telescope.builtin").buffers() end,  desc = "[f]ind [b]uffer (Telescope)"},
        {"<leader>fh", function() require("telescope.builtin").builtin() end,  desc = "[f]ind telescope [h]elper builtin pickers (Telescope)"},
        {"<leader>fc", function() require("telescope.builtin").grep_string() end,  mode= "x",desc = "[f]ind string under [c]ursor in cwd (Telescope)"},
    },
    opts = {
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
                    ["<C-k>"] = require("telescope.actions").move_selection_previous, -- move to prev result
                    ["<C-j>"] = require("telescope.actions").move_selection_next, -- move to next result
                    ["<C-q>"] = require("telescope.actions").smart_send_to_qflist + require("telescope.actions").open_qflist,
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
    },
    init = function ()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfigTelescope", {}),
            callback = function(env)
                local keymap = vim.keymap -- for concisenesss
                local opts = { noremap = true, silent = true }
                local bufnr = env.buf

                opts.buffer = bufnr

                opts.desc = "Show [l]SP [w]orkspace [d]iagnostics (Telescope)"
                keymap.set("n", "<leader>lwd", function() require("telescope.builtin").diagnostics() end, opts)

                opts.desc = "Show [l]SP buffer [D]iagnostics (Telescope)"
                keymap.set("n", "<leader>lD", function() require("telescope.builtin").diagnostics({bufnr=0}) end, opts)

                local client = vim.lsp.get_client_by_id(env.data.client_id)

                -- -- lsp return if client not present
                if not client then
                    return
                end

                ---@diagnostic disable-next-line: undefined-field
                local server_capabilities = client.server_capabilities

                if not server_capabilities then
                    return
                end

                if server_capabilities.referencesProvider then
                    opts.desc = "[g]o to LSP [R]eferences (Telescope)"
                    keymap.set("n", "gR", function() require("telescope.builtin").lsp_references() end, opts)
                end

                if server_capabilities.definitionProvider then
                    opts.desc = "[g]o LSP [d]efinition (Telescope)"
                    keymap.set("n", "gd", function() require("telescope.builtin").lsp_definitions() end, opts)
                end

                if server_capabilities.typeDefinitionProvider then
                    opts.desc = "[g]o LSP [t]ype definitions (Telescope)"
                    keymap.set("n", "gt", function() require("telescope.builtin").lsp_type_definitions() end, opts)
                end

                if server_capabilities.implementationProvider then
                    opts.desc = "[g]o LSP [i]mplementations (Telescope)"
                    keymap.set("n", "gi", function() require("telescope.builtin").lsp_implementations() end, opts)
                end

                if server_capabilities.workspaceSymbolProvider then
                    opts.desc = "[g] [w]orkspace document [s]ymbols (Telescope)"
                    keymap.set("n", "<leader>gws", function() require("telescope.builtin").lsp_workspace_symbols() end, opts)
                end
            end
        })
    end,
    config = function(_, opts)
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
        -- highlights.setup()
        require("telescope").setup(opts)
    end
}


