return {
    "https://github.com/nvim-orgmode/orgmode",
    pin = true,
    event = "VeryLazy",
    opts = {
        org_agenda_files = "~/Documents/orgfiles/**/*",
        org_default_notes_file = "~/Documents/orgfiles/refile.org",
    },
    config = function(_, opts)
        -- Setup orgmode
        require("orgmode").setup(opts)
        -- Experimental LSP support
        vim.lsp.enable("org")
    end,
}
