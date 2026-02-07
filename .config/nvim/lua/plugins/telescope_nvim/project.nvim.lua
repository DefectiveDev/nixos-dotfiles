return {
    "https://github.com/DrKJeff16/project.nvim.git",
    pin = true,
    specs = {
        "https://github.com/nvim-telescope/telescope.nvim.git",
        config = function ()
            require("telescope").load_extension("projects")
        end
    },
    event = {"BufReadPre", "BufNewFile"},
    keys = {
        {"<leader>fp",function ()
            if not vim.g.projects_loaded then -- a short delay so hopefully the history file will be loaded
                vim.cmd("sleep 100ms")
                vim.g.projects_loaded = true
            end
            vim.cmd("Telescope projects")
        end, desc = "[f]ind [p]rojects (Projects-Telescope)"},
        {"<leader>fap", "<cmd>ProjectAddManually<cr>", desc = "[f]inder [a]dd current directory to [p]rojects (Projects-Telescope)"}
    },
    cmd = { "ProjectAddManually", "Telescope projects" },
    opts = { patterns = { ".envrc", ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" } },
    config = function(_, opts)
        require("project").setup(opts)
        function _ADD_CURR_DIR_TO_PROJECTS()
            local historyfile = require("project_nvim.utils.path").historyfile
            local curr_directory = vim.fn.expand( "%:p:h" )
            vim.cmd("!echo " .. curr_directory .. " >> " .. historyfile)
        end
        vim.cmd("command! ProjectAddManually lua _ADD_CURR_DIR_TO_PROJECTS()")
    end
}
