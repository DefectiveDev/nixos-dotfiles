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
        config = function ()
            require("lazy").load({plugins = {"nvim-treesitter-context"}})
        end
    }}
}
