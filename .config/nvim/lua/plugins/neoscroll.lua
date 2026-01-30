return {
    "karb94/neoscroll.nvim",
    keys = {
        {"<C-u>",  function() require("neoscroll").ctrl_u({ duration = 150 }) end, mode = { 'n', 'v', 'x'}, desc = "Scroll Up" },
        {"<C-d>",  function() require("neoscroll").ctrl_d({ duration = 150 }) end, mode = { 'n', 'v', 'x'}, desc = "Scroll Down" },
        {"<C-b>",  function() require("neoscroll").ctrl_b({ duration = 250 }) end, mode = { 'n', 'v', 'x'}, desc = "" },
        {"<C-f>",  function() require("neoscroll").ctrl_f({ duration = 250 }) end, mode = { 'n', 'v', 'x'}, desc = "" },
        {"<C-y>",  function() require("neoscroll").scroll(-0.1, { move_cursor=false; duration = 100 }) end, mode = { 'n', 'v', 'x'}, desc = "" },
        {"<C-e>",  function() require("neoscroll").scroll(0.1, { move_cursor=false; duration = 100 }) end, mode = { 'n', 'v', 'x'}, desc = "" },
        {"zt",     function() require("neoscroll").zt({ half_win_duration = 150 }) end, mode = { 'n', 'v', 'x'}, desc = "" },
        {"zz",     function() require("neoscroll").zz({ half_win_duration = 150 }) end, mode = { 'n', 'v', 'x'}, desc = "" },
        {"zb",     function() require("neoscroll").zb({ half_win_duration = 150 }) end, mode = { 'n', 'v', 'x'}, desc = "" },
    },
    opts = {
        mappings = {}
    },
}
