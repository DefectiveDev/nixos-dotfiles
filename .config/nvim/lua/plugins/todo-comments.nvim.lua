return {
    -- TEST:hello world
    -- TODO:hello world
    -- FIXME:hello world
    -- HACK:hello world
    -- PERF:hello world
    -- WARN:hello world
    -- NOTE:hello world
	"https://github.com/folke/todo-comments.nvim.git",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "https://github.com/nvim-lua/plenary.nvim.git" },
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
	config = function(_, opts)
		local todo = require("todo-comments")
		todo.setup(opts)
		local keymap = vim.keymap
		keymap.set('n', "]t", function() todo.jump_next() end, {desc = "Next [t]odo (ToDo-Comments)"})
		keymap.set('n', "[t", function() todo.jump_prev() end, {desc = "Previous [t]odo (ToDo-Comments)"})
		keymap.set('n', "<leader>ft", ":TodoTelescope<cr>", {desc = "[f]ind [t]odo (ToDo-Comments + Telescope)", silent = true})
	end
}
