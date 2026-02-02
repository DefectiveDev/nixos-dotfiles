return {
	"https://github.com/folke/which-key.nvim.git",
	event = "VeryLazy",
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
