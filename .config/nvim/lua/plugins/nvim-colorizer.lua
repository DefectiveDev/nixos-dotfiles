return {
	"https://github.com/catgoose/nvim-colorizer.lua.git",
    pin = true,
	event = { "BufReadPre", "BufNewFile" },
	opts = {
	    filetypes = {
	        -- include everything else
            "*",
            -- exclude these filetypes
            "!TelescopePrompt",
            "!lazy"
        }
	},
}
