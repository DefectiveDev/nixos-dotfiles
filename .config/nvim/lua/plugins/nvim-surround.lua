return {{
	"kylechui/nvim-surround",
	keys = { "ys", "ds", "cs" },
	version ="^3.0.0",
	opts = {
		highlight = {duration = 0}
	},
},{ "XXiaoA/ns-textobject.nvim", enabled = false, keys = { "ys", "ds", "cs",}, dependencies = {"kylechui/nvim-surround"}, opts = {}}}
