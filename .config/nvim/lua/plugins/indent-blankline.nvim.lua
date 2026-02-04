return {
	"https://github.com/lukas-reineke/indent-blankline.nvim.git",
	event = { "BufReadPre", "BufNewFile" },
	enabled = false,
	main = "ibl",
	dependencies = { "https://github.com/nvim-treesitter/nvim-treesitter.git" },
	opts = {
		indent = {
			tab_char = '▎',
		},
		scope = {
			highlight = {"StorageClass"},
			show_start = false,
			show_end = false,
			include = {
				node_type ={
					['*'] = {
						-- "block",
						"class", -- find names by doing InspectTree command!
						"function",
						"method",
						"^if",
						"^while",
						"^for",
						"^object",
						"^table",
						"^type",
						"field",
						"^import",
						"arguments",
						"return_statement",
						"function_declaration"
					}
				}
			}
		}
	},
	config = function (_, opts)
		local indent_blankline = require("ibl")
		local colors = require("dracula").colors()
		vim.api.nvim_set_hl(0, "IndentBlankLine", {fg = colors.cyan})
		vim.api.nvim_set_hl(0, "ScopeBlankLine", {fg = colors.pink})
		opts.indent.highlight = {"IndentBlankLine"}
		opts.scope.highlight = {"ScopeBlankLine"}
		indent_blankline.setup(opts)

		local hooks = require("ibl.hooks")
		hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
	end
}
