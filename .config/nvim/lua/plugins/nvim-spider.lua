return {
	"chrisgrieser/nvim-spider",
	keys = {
		{ "sw", function() require('spider').motion('w') end, mode = { "n", "o", "x" }, desc = "Next subword" },
		{ "se", function() require('spider').motion('e') end, mode = { "n", "o", "x" }, desc = "Next end of subword" },
		{ "sb", function() require('spider').motion('b') end, mode = { "n", "o", "x" }, desc = "Previous subword"},
		{ "sge", function() require('spider').motion('ge') end, mode = { "n", "o", "x" }, desc = "Prev end of subword" },
	},
}
