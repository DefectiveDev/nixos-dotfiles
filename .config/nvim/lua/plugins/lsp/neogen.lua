return {
	"danymat/neogen",
	enabled = false,
	dependencies = "nvim-treesitter/nvim-treesitter",
	keys = { {"<leader>lg", ":Neogen<CR>", desc = "Generate annotations (Neogen)", silent= true } },
	opts = {snippet_engine = "luasnip"},
}
