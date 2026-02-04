return{
    "https://github.com/nvim-tree/nvim-tree.lua.git",
    pin = true,
    enabled = false,
    dependencies = { "https://github.com/nvim-tree/nvim-web-devicons.git" },
    keys = {
        { "<leader>ee", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
        { "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", desc = "Toggle file explorer on current file" },
        { "<leader>ec", "<cmd>NvimTreeCollapse<CR>", desc = "Collapse file explorer" },
        { "<leader>er", "<cmd>NvimTreeRefresh<CR>", desc = "Refresh file explorer" },
    },
    cmd = "NvimTreeToggle",
    opts = {
        --sort_by = "case_sensitive",
        view = {
            width = 35,
            relativenumber = true,
        },
        renderer = {
            group_empty = true,
        },
        filters = {
            dotfiles = false,
        },
    },
    config = function(_, opts)
        -- BUG: lazy load this plugin like telescope file browser. This will prevent unnecessary startup time

        -- disable netrw at the very start of your init.lua
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- set termguicolors to enable highlight groups
        vim.opt.termguicolors = true

        require("nvim-tree").setup(opts)
    end
}
