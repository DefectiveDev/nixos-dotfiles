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
        {"<leader>ff",  require("telescope.builtin").find_files, desc = "Fuzzy find files in cwd (Telescope)"},
        {"<leader>fg", require("telescope.builtin").live_grep,  desc = "Find string in cwd (Telescope)"},
        {"<leader>fb",require("telescope.builtin").buffers,  desc = "Find buffer (Telescope)"},
        {"<leader>fh",  require("telescope.builtin").help_tags,  desc = "Find help tags (Telescope)"},
        {"<leader>fc", require("telescope.builtin").grep_string,  desc = "Find string under cursor in cwd (Telescope)"},
        {"<leader>fr", require("telescope.builtin").oldfiles,  desc = "Fuzzy find recent files (Telescope)" }
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                layout_config = {
                    height = 0.99,
                    width = 0.99
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
                    file_ignore_patterns = {'.git', '.direnv', '.uid', '.ttf'},
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
    keys = {{"<leader>fm", "<cmd>Telescope aerial<cr>", desc = "Find method (Aerial-Telescope)" }},
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function ()
        require("aerial").setup()
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
    opts = {
        patterns = { "flake.nix", ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
    },
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
}}
