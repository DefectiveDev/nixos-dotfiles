return {
    "https://github.com/stevearc/aerial.nvim.git",
    pin = true,
    -- BUG: Aerial does not load lsp backend first attempt. Other solutions will break due to a lack of a backend.
    -- HACK: Use telescope builtin as a back up if lsp is not attached.
    keys = {{
        "<leader>gs",
        function ()
            -- if current buffer has a client attached
            if vim.lsp.get_clients({bufnr=vim.fn.bufnr()})[1] ~= nil then
                require("telescope").extensions.aerial.aerial()
                return
            end
            -- otherwise use telescope builtin fall back
            require("telescope.builtin").treesitter()
        end,
        desc = "[g]o to document [s]ymbol in buffer (Aerial + Telescope)",
    }},
    cmd = "AerialToggle",
    opts = {
        filter_kind = false,
        backends = { "lsp", "markdown", "asciidoc", "man" },
    },
    specs = {
        "https://github.com/nvim-telescope/telescope.nvim.git",
        config = function ()
            -- load aerial as an extension when telescope loads
            require("telescope").load_extension("aerial")
        end
    }
}
