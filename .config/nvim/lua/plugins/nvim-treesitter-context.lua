return {
    "https://github.com/nvim-treesitter/nvim-treesitter-context.git",
	dependencies = "https://github.com/nvim-treesitter/nvim-treesitter.git",
	event = "UIEnter",
	config = function()
        vim.cmd('hi TreesitterContext guibg=none')
    end
}
