return {
    "numToStr/Comment.nvim",
    event = {"BufReadPre", "BufNewFile"},
    keys = {
		{"gc", "gc", mode = {'v','n'}, desc = "[g]enerate [c]omment (Comment)"},
		{"gb", "gb", mode = {'v','n'}, desc = "[g]enerate [b]lock comment (Comment)"},
	},
    opts = {}
}
