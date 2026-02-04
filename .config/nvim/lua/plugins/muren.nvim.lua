return {
	"https://github.com/AckslD/muren.nvim.git",
	pin = true,
	enabled = false,
	cmd = {
		"MurenToggle",
		"MurenOpen",
		"MurenClose",
		"MurenFresh",
		"MurenUnique"
	},
	keys = {{ "<leader>lmr", function() require("muren.api").toggle_ui() end, desc= "(Muren) search and replace"}},
	config = true
}
