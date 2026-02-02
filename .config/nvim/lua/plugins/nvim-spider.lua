return {
	"https://github.com/chrisgrieser/nvim-spider.git",
	keys = {
		{ "sw", function() require('spider').motion('w') end, mode = { "n", "o", "x" }, desc = "Next [s]ub[w]ord (Spider)" },
		{ "se", function() require('spider').motion('e') end, mode = { "n", "o", "x" }, desc = "Next [s]ubword [e]nd (Spider)" },
		{ "sb", function() require('spider').motion('b') end, mode = { "n", "o", "x" }, desc = "[s]ubword [b]ack to previous (Spider)"},
		{ "sge", function() require('spider').motion('ge') end, mode = { "n", "o", "x" }, desc = "Previous [s]ubword [g]o to [e]nd (Spider)" },
	},
}
