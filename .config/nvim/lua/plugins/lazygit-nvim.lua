-- nvim v0.8.0
return {
    "https://github.com/kdheepak/lazygit.nvim.git",
    lazy = true,
    enabled = false,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    -- dependencies = {
    --     "https://github.com/nvim-lua/plenary.nvim.git",
    -- },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "([L]azy[G]it)" }
    },
    config = function ()
        vim.g.lazygit_floating_window_scaling_factor = 1
    end
}
