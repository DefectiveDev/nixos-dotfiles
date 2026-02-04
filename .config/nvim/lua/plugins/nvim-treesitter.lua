return {
    "https://github.com/nvim-treesitter/nvim-treesitter.git",
    pin = false,
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    opts = {
        --enable syntax highlighting
        indent = {
            enable = true,
            -- disable = {"c_sharp"},
        },
        auto_install = true,
        highlight = { enable = true },
        incremental_selection = {enable = true},
        endwise = { enable = true }
    },
    config = function (_, opts)
        require ( 'nvim-treesitter.install' ).prefer_git = false
        require("nvim-treesitter").setup(opts)
    end
}
