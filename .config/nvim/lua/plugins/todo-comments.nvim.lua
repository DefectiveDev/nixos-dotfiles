return {
    -- TEST:hello world
    -- TODO:hello world
    -- FIXME:hello world
    -- HACK:hello world
    -- PERF:hello world
    -- WARN:hello world
    -- NOTE:hello world
	"https://github.com/folke/todo-comments.nvim.git",
	pin = false,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "https://github.com/nvim-lua/plenary.nvim.git" },
	keys = {
        { "]t", function() require("todo-comments").jump_next() end, desc = "Next [t]odo (ToDo-Comments)" },
        { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous [t]odo (ToDo-Comments)" }
    },
    specs = {
        "https://github.com/nvim-telescope/telescope.nvim.git",
        keys = { "<leader>ft", ":TodoTelescope<cr>", desc = "[f]ind [t]odo (ToDo-Comments + Telescope)", silent = true }
    },
	opts = {
		keywords = {
			TEST = {
				icon = "󰚐 "
			}
		},
		highlight = {
		-- 	pattern = [[.*<(KEYWORDS)\s*]]
		-- },
		-- search = {
		-- 	pattern = [[\b(KEYWORDS)\b]]
		}
	},
}
