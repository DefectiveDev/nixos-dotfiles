return {
    "https://github.com/DrKJeff16/project.nvim.git",
    version = "v0.7.0-1",
    -- enabled = false,
    lazy =false,
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
        end, desc = "[f]ind [p]rojects (Project + Telescope)"},
        {"<leader>fap", "<cmd>ProjectAddCurDir<cr>", desc = "[f]inder [a]dd current directory to [p]rojects (Project)"}
    },
    cmd = { "ProjectAddCurDir", "Telescope projects" },
    opts = { patterns = { ".envrc", ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" } },
    config = function(_, opts)
        require("project").setup(opts)
        function _ADD_CURR_DIR_TO_PROJECTS()
            local curr_directory = vim.fn.expand( "%:p:h" )
            local command = "ProjectAdd " .. curr_directory
            vim.cmd(command)
            vim.notify("Added project path to file: " .. curr_directory)
        end
        vim.cmd("command! ProjectAddCurDir lua _ADD_CURR_DIR_TO_PROJECTS()")
    end
}
