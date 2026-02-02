return {
    "https://github.com/stevearc/aerial.nvim.git",
    keys = {{"<leader>gs", "<cmd>Telescope aerial<cr>", desc = "[g]o to document [s]ymbol in buffer (Aerial + Telescope)" }},
    dependencies = { "https://github.com/nvim-telescope/telescope.nvim.git" },
    opts = {
        filter_kind = false,
        backends = { "lsp","treesitter", "markdown", "asciidoc", "man" },
    },
    config = function (_, opts)
        require("aerial").setup(opts)
        require("telescope").load_extension("aerial")
    end
}
