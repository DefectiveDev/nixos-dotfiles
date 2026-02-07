return {
    "https://github.com/stevearc/aerial.nvim.git",
    pin = true,
    keys = {{"<leader>gs", "<cmd>Telescope aerial<cr>", desc = "[g]o to document [s]ymbol in buffer (Aerial + Telescope)" }},
    opts = {
        filter_kind = false,
        backends = { "lsp","treesitter", "markdown", "asciidoc", "man" },
    },
    config = function (_, opts)
        require("aerial").setup(opts)
    end,
    specs = {
        "https://github.com/nvim-telescope/telescope.nvim.git",
        config = function ()
            require("telescope").load_extension("aerial")
        end
    }
}
