return {
    "debugloop/telescope-undo.nvim",
    keys = {{"<leader>fu", "<cmd>Telescope undo<cr>", desc = "Undo (Undo-Telescope)" }},
    dependencies = { "nvim-telescope/telescope.nvim" },
    specs = {
        "nvim-telescope/telescope.nvim",
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
