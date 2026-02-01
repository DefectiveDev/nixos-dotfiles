return {
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
}
