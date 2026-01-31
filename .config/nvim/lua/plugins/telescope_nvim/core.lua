return {{
    "nvim-telescope/telescope.nvim",
    tag = "v0.2.0",
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
        {"<leader>fh", function() require("telescope.builtin").help_tags() end,  desc = "Find help tags (Telescope)"},
        {"<leader>fc", function() require("telescope.builtin").grep_string() end,  desc = "Find string under cursor in cwd (Telescope)"},
        {"<leader>fr", function() require("telescope.builtin").oldfiles() end,  desc = "Fuzzy find recent files (Telescope)" }
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
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
            extensions = {
                file_browser = {
                    hijack_netrw = true,
                    layout_strategy = "vertical",
                    grouped = true,
                    auto_depth = true
                },
                oil = {
                    hidden = true,
                    debug = false,
                    no_ignore = false,
                    show_preview = true,
                },
                undo = {
                    side_by_side = true,
                    layout_strategy = "vertical",
                    layout_config = {
                        preview_height = 0.7,
                    },
                },
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
            },
        })

        local currentDirectory = "plugins.telescope_nvim."
        require(currentDirectory.."highlights").setup()
        -- telescope.load_extension("fzf")
    end
},{
    "nvim-telescope/telescope-ui-select.nvim",
    lazy = true,
    dependencies = { "nvim-telescope/telescope.nvim" },
    init = function ()
        vim.ui.select = function(...)
            require("lazy").load({plugins = {"telescope-ui-select.nvim"}})
            return vim.ui.select(...)
        end
    end,
    config = function()
        require("telescope").load_extension("ui-select")
    end
},{
    "debugloop/telescope-undo.nvim",
    keys = {{"<leader>fu", "<cmd>Telescope undo<cr>", desc = "Undo (Undo-Telescope)" }},
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function ()
        require('telescope').load_extension("undo")
    end
},{

    "stevearc/aerial.nvim",
    keys = {{"<leader>fd", "<cmd>Telescope aerial<cr>", desc = "Find document symbol in buffer (Aerial-Telescope)" }},
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = {
        filter_kind = false,
        backends = { "lsp","treesitter", "markdown", "asciidoc", "man" },
    },
    config = function (_, opts)
        require("aerial").setup(opts)
        require("telescope").load_extension("aerial")
    end
},{
    "nvim-telescope/telescope-file-browser.nvim",
    keys = {{"<leader>fe", "<cmd>Telescope file_browser<cr>", desc = "Open (File-Browser-Telescope)"}},
    cmd = "Telescope file_browser",
    dependencies = { "nvim-telescope/telescope.nvim" },
    init = function()
        if vim.fn.argc() == 1 then
            ---@diagnostic disable-next-line: param-type-mismatch
            local stat = vim.loop.fs_stat(vim.fn.argv(0))
            if stat and stat.type == "directory" then
                require("lazy").load({plugins = {"telescope-file-browser.nvim"}})
            end
        end
    end,
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        require("telescope").load_extension("file_browser")
    end
},
{
    "DrKJeff16/project.nvim",
    specs = { "nvim-telescope/telescope.nvim" },
    event = {"BufReadPre", "BufNewFile"},
    keys = {
        {"<leader>fp",function ()
            if not vim.g.projects_loaded then -- a short delay so hopefully the history file will be loaded
                vim.cmd("sleep 100ms")
                vim.g.projects_loaded = true
            end
            vim.cmd("Telescope projects")
        end, desc = "Open (Projects-Telescope)"},
        {"<leader>fap", "<cmd>ProjectAddManually<cr>", desc = "Add current directory to (Projects-Telescope)"}
    },
    cmd = { "ProjectAddManually", "Telescope projects" },
    opts = { patterns = { "flake.nix", ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" } },
    config = function(_, opts)
        require("project").setup(opts)
        require("telescope").load_extension("projects")
        function _ADD_CURR_DIR_TO_PROJECTS()
            local historyfile = require("project_nvim.utils.path").historyfile
            local curr_directory = vim.fn.expand( "%:p:h" )
            vim.cmd("!echo " .. curr_directory .. " >> " .. historyfile)
        end
        vim.cmd("command! ProjectAddManually lua _ADD_CURR_DIR_TO_PROJECTS()")
    end
},
{
    'prochri/telescope-all-recent.nvim',
    dependencies = { "nvim-telescope/telescope.nvim", "kkharji/sqlite.lua" },
    opts = function ()
        vim.api.nvim_set_var("sqlite_clib_path", os.getenv("SQLITE_PATH"))
        return {
            database = {
                folder = vim.fn.stdpath("data"),
                file = "telescope-all-recent.sqlite3",
                max_timestamps = 10,
            },
            debug = false,
            scoring = {
                recency_modifier = { -- also see telescope-frecency for these settings
                    [1] = { age = 240, value = 100 }, -- past 4 hours
                    [2] = { age = 1440, value = 80 }, -- past day
                    [3] = { age = 4320, value = 60 }, -- past 3 days
                    [4] = { age = 10080, value = 40 }, -- past week
                    [5] = { age = 43200, value = 20 }, -- past month
                    [6] = { age = 129600, value = 10 } -- past 90 days
                },
                -- how much the score of a recent item will be improved.
                boost_factor = 0.0001
            },
            default = {
                disable = true, -- disable any unkown pickers (recommended)
                use_cwd = true, -- differentiate scoring for each picker based on cwd
                sorting = 'recent' -- sorting: options: 'recent' and 'frecency'
            },
            pickers = { -- allows you to overwrite the default settings for each picker
                man_pages = { -- enable man_pages picker. Disable cwd and use frecency sorting.
                    disable = false,
                    use_cwd = false,
                    sorting = 'frecency',
                },

                -- change settings for a telescope extension.
                -- To find out about extensions, you can use `print(vim.inspect(require'telescope'.extensions))`
                ['extension_name#extension_method'] = {
                    -- [...]
                }
            }
        }
    end
},
{
    "albenisolmos/telescope-oil.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "stevearc/oil.nvim" },
    cmd = { "Telescope oil "},
    keys = {{"<leader>fo", function () require("telescope").extensions.oil.oil() end, desc = "Search directories then do file operations (Telescope Oil)"}},
    config = function () require("telescope").load_extension("oil") end
}

}
