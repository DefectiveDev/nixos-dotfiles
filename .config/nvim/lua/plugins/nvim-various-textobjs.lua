return {
	"chrisgrieser/nvim-various-textobjs",
    keys = {
        { "ii",
            function ()
                require("various-textobjs").indentation("inner", "inner")
            end,
            mode = {"o", "x"},
            desc = "inner-inner indentation textobj"
        },
        { "ai",
            function ()
                require("various-textobjs").indentation("outer", "inner")
            end,
            mode = {"o", "x"},
            desc = "outer-inner indentation textobj"
        },
        { "iI",
            function ()
                require("various-textobjs").indentation("inner", "inner")
            end,
            mode = {"o", "x"},
            desc = "inner-inner indentation textobj"
        },
        { "aI",
            function ()
                require("various-textobjs").indentation("outer", "outer")
            end,
            mode = {"o", "x"},
            desc = "outer-outer indentation textobj"
        },
        { "I",
            function ()
                require("various-textobjs").restOfIndentation()
            end,
            mode = {"o", "x"},
            desc = "rest of indentation textobj"
        },
        { "isw",
            function ()
                require("various-textobjs").subword("inner")
            end,
            mode = {"o", "x"},
            desc = "inner subword textobj"
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
            desc = "inner chainMember textobj"
        },
        { "am",
            function ()
                require("various-textobjs").er("outer")
            end,
            mode = {"o", "x"},
            desc = "outer chainMember textobj"
        }
    },
	opts = {
		keymaps = {
			useDefaults = false
		}
	},
}
