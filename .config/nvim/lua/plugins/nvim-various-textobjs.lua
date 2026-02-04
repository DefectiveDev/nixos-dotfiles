return {
	"https://github.com/chrisgrieser/nvim-various-textobjs.git",
    pin = true,
    keys = {
        { "ii",
            function ()
                require("various-textobjs").indentation("inner", "inner")
            end,
            mode = {"o", "x"},
            desc = "[i]nner-inner [i]ndentation (Various-Textobjs)"
        },
        { "ai",
            function ()
                require("various-textobjs").indentation("outer", "inner")
            end,
            mode = {"o", "x"},
            desc = "[a]round-inner [i]ndentation (Various-Textobjs)"
        },
        { "iI",
            function ()
                require("various-textobjs").indentation("inner", "inner")
            end,
            mode = {"o", "x"},
            desc = "[i]nner-inner [I]ndentation (Various-Textobjs)"
        },
        { "aI",
            function ()
                require("various-textobjs").indentation("outer", "outer")
            end,
            mode = {"o", "x"},
            desc = "[a]round-around [I]ndentation (Various-Textobjs)"
        },
        { "R",
            function ()
                require("various-textobjs").restOfIndentation()
            end,
            mode = {"o", "x"},
            desc = "[R]est of indentation (Various-Textobjs)"
        },
        { "isw",
            function ()
                require("various-textobjs").subword("inner")
            end,
            mode = {"o", "x"},
            desc = "[i]nner [s]ub[w]ord (Various-Textobjs)"
        },
        { "asw",
            function ()
                require("various-textobjs").subword("outer")
            end,
            mode = {"o", "x"},
            desc = "outer subword textobj"
        },
        { "im",
            function ()
                require("various-textobjs").chainMember("inner")
            end,
            mode = {"o", "x"},
            desc = "[i]nner chain [m]ember (Various-Textobjs)"
        },
        { "am",
            function ()
                require("various-textobjs").chainMember("outer")
            end,
            mode = {"o", "x"},
            desc = "[a]round chain [m]ember (Various-Textobjs)"
        }
    },
	opts = {
		keymaps = {
			useDefaults = false
		}
	},
}
