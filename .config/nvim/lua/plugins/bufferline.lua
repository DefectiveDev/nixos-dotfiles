return {
	'akinsho/bufferline.nvim',
	enabled=false,
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function ()
		vim.opt.termguicolors = true
		require("bufferline").setup()
        vim.cmd([[

            autocmd ColorScheme * highlight BufferLineFill guibg=none

            highlight BufferLineFillSelected guibg=none

            highlight BufferLineFillVisible guibg=none

            highlight BufferLineDevIconLua guibg=none

            highlight BufferLineCloseButton guibg=none

            highlight BufferLineBackground guibg=none

            highlight BufferLineSeparator guifg=none

            highlight BufferLineSeparatorSelected guifg=none

        ]])
	end,
}
