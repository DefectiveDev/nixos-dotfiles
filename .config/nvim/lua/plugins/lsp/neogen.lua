return {
	"https://github.com/danymat/neogen.git",
    pin = true,
	enabled = false,
	dependencies = "https://github.com/nvim-treesitter/nvim-treesitter.git",
	keys = { {"<leader>lg", ":Neogen<CR>", desc = "Generate annotations (Neogen)", silent= true } },
	opts = {snippet_engine = "luasnip"},
}
