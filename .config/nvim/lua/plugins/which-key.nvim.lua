return {
	"https://github.com/folke/which-key.nvim.git",
	event = "VeryLazy",
	tag = "v3.13.3",
	init = function()
		vim.o.timeout = false
		vim.o.timeoutlen = 300
	end,
	opts = {
	    triggers = {
            { "<auto>", mode = "nixsotc" },
            { "s", mode = {"n","x","o"} },
            { "S", mode = {"n","x","o"} },
            { "q", mode = {"n"} }
        }
    },
}
