return {
	"https://github.com/folke/noice.nvim.git",
	pin = true,
	event = "VeryLazy",
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"https://github.com/MunifTanjim/nui.nvim.git",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		-- { "rcarriga/nvim-notify", opts = {background_colour = "#22212C"}}
        { "https://github.com/folke/snacks.nvim.git", opts = { notifier = { enabled = true } } }
	},
	specs = {
        "https://github.com/nvim-telescope/telescope.nvim.git",
        cmd = {"Telescope"},
        specs = {
            {
                "https://github.com/folke/noice.nvim.git",
                keys = { { "<leader>fn", ":Telescope noice<cr>", desc = "[f]ind [n]otifications (Noice + Telescope)" } }
            }
        }
    },
	opts = {
		lsp = {
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		-- you can enable a preset for easier configuration
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = false, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = false, -- add a border to hover docs and signature help
		},

		commands = {
		    history = {
		        filter = false
            }
        }
	}
}
