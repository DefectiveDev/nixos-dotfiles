return {
    "https://github.com/karb94/neoscroll.nvim.git",
	pin = true,
    keys = {
        {"<C-u>",  function() require("neoscroll").ctrl_u({ duration = 150 }) end, mode = { 'n', 'v', 'x'}, desc = "Scroll up half-page (neoscroll)" },
        {"<C-d>",  function() require("neoscroll").ctrl_d({ duration = 150 }) end, mode = { 'n', 'v', 'x'}, desc = "Scroll down half-page (neoscroll)" },
        {"<C-b>",  function() require("neoscroll").ctrl_b({ duration = 250 }) end, mode = { 'n', 'v', 'x'}, desc = "Scroll up full-page (neoscroll)" },
        {"<C-f>",  function() require("neoscroll").ctrl_f({ duration = 250 }) end, mode = { 'n', 'v', 'x'}, desc = "Scroll down full-page (neoscroll)" },
        {"<C-y>",  function() require("neoscroll").scroll(-0.1, { move_cursor=false; duration = 100 }) end, mode = { 'n', 'v', 'x'}, desc = "Scroll up no cursor movement (neoscroll)" },
        {"<C-e>",  function() require("neoscroll").scroll(0.1, { move_cursor=false; duration = 100 }) end, mode = { 'n', 'v', 'x'}, desc = "Scroll down no cursor movement (neoscroll)" },
        {"zt",     function() require("neoscroll").zt({ half_win_duration = 150 }) end, mode = { 'n', 'v', 'x'}, desc = "[z]enter [t]op (neoscroll)" },
        {"zz",     function() require("neoscroll").zz({ half_win_duration = 150 }) end, mode = { 'n', 'v', 'x'}, desc = "[zz]enter cursor (neoscroll)" },
        {"zb",     function() require("neoscroll").zb({ half_win_duration = 150 }) end, mode = { 'n', 'v', 'x'}, desc = "[z]enter [b]ottom center cursor (neoscroll)" },
    },
    opts = {
        mappings = {}
    },
}
