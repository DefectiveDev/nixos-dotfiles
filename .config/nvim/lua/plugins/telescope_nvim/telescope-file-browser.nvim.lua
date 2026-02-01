return {
    "nvim-telescope/telescope-file-browser.nvim",
    keys = {{"<leader>fe", "<cmd>Telescope file_browser<cr>", desc = "[f]ile [e]xplorer (File-Browser-Telescope)"}},
    cmd = "Telescope file_browser",
    dependencies = { "nvim-telescope/telescope.nvim" },
    specs = {
        "nvim-telescope/telescope.nvim",
        opts = {
            extensions = {
                file_browser = {
                    hijack_netrw = true,
                    layout_strategy = "vertical",
                    grouped = true,
                    auto_depth = true,
                    -- cwd = "%:p:h",
                    -- cwd_to_path = true,
                },
            }
        }
    },
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
}
