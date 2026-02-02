return {
	"https://github.com/andweeb/presence.nvim.git",
	event = "VeryLazy",
	enabled = false,
	opts = function()
		-- Create hard link to discord rich presence on startup
		vim.cmd[[silent! !ln -f $XDG_RUNTIME_DIR/{app/com.discordapp.Discord,}/discord-ipc-0]]
		-- return {log_level = "debug"}
	end
}
