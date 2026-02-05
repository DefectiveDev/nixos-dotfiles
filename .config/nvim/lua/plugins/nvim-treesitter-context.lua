return {
    "https://github.com/nvim-treesitter/nvim-treesitter-context.git",
    pin = true,
	dependencies = "https://github.com/nvim-treesitter/nvim-treesitter.git",
	lazy = true,
	config = function()
        vim.cmd('hi TreesitterContext guibg=none')
    end,
    specs = {{
        "https://github.com/nvim-treesitter/nvim-treesitter.git",
        opts = function (_, opts)
            require("lazy").load({plugins = {"nvim-treesitter-context"}})
            return opts
        end
    }}
}
