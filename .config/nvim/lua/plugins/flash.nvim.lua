return {
	"https://github.com/folke/flash.nvim.git",
	pin = true,
	keys = {
	    -- TODO: f and t keymaps need to use a function to maintain their descriptions
		{'f','f', mode = {"n","o", "x"}, desc = "[f]orward including character (Flash)"},
		{'F','F', mode = {"n","o", "x"}, desc = "[F]orward including previous character (Flash)"},
		{'t','t', mode = {"n","o", "x"}, desc = "[t]orward not-including character (Flash)"},
		{'T','T', mode = {"n","o", "x"}, desc = "[T]orward not-including previous character (Flash)"},
		{ "<leader>s", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "[s]earch (Flash)" },
		{ "<leader>S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "[S]earch node Treesitter (Flash)" },
		{ "<leader>r", mode = "o", function() require("flash").remote() end, desc = "[r]emote Search (Flash)" },
		{ "<leader>R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "[R]emote treesitter Search (Flash)" },
		-- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle (Flash) Search" },
	},
	opts = {},
}
