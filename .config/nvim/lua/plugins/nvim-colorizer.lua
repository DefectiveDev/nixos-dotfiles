return {
	"https://github.com/catgoose/nvim-colorizer.lua.git",
	event = { "BufReadPre", "BufNewFile" },
	config = function ()
		require("colorizer").setup(nil, { RGB = false, names = false, RRGGBBAA = true})
	end
}
