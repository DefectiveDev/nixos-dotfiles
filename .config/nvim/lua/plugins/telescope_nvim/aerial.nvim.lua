return {
    "https://github.com/stevearc/aerial.nvim.git",
    pin = true,
    -- BUG: Aerial does not load lsp backend first attempt. Other solutions will break due to a lack of a backend.
    keys = {{"<leader>gs", "<cmd>Telescope aerial<cr>", desc = "[g]o to document [s]ymbol in buffer (Aerial + Telescope)" }},
    opts = {
        filter_kind = false,
        backends = { "lsp","treesitter", "markdown", "asciidoc", "man" },
    },
    specs = {
        "https://github.com/nvim-telescope/telescope.nvim.git",
        config = function ()
            require("telescope").load_extension("aerial")
        end
    }
}
