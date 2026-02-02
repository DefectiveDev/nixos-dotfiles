return {
    "https://github.com/debugloop/telescope-undo.nvim.git",
    keys = {{"<leader>fu", "<cmd>Telescope undo<cr>", desc = "[f]ind [u]ndo (Undo-Telescope)" }},
    dependencies = { "https://github.com/nvim-telescope/telescope.nvim.git" },
    specs = {
        "https://github.com/nvim-telescope/telescope.nvim.git",
        opts = {
            extensions = {
                undo = {
                    side_by_side = true,
                    layout_strategy = "vertical",
                    layout_config = {
                        preview_height = 0.7,
                    },
                },
            }
        }
    },
    config = function ()
        require('telescope').load_extension("undo")
    end
}
