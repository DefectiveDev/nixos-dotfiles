return {{
    -- "kylechui/nvim-surround",
    -- Custom fork to handle highlight
    "DefectiveDev/nvim-surround-highlights",
    keys = {
        { "sy", desc = "Add a surrounding pair around a motion (normal mode)" },
        { "sY", desc = "Add a surrounding pair around a motion, on new lines (normal mode)" },
        { "sd", desc = "Delete a surrounding pair"},
        { "sc", desc = "Change a surrounding pair"},
        { "sC", desc = "Change a surrounding pair, putting replacements on new lines"},
        { "<C-g>s", mode = "i", desc = "Add a surrounding pair around the cursor (insert mode)" },
        { "<C-g>S", mode = "i", desc = "Add a surrounding pair around the cursor, on new lines (insert mode)" },
        { "S", mode = "v", desc = "Add a surrounding pair around a visual selection" },
        { "gS", mode = "x", desc = "Add a surrounding pair around a visual selection, on new lines" },
    },
    -- version ="^3.0.0",
    opts = {
        keymaps = {
            insert = "<C-g>s",
            insert_line = "<C-g>S",
            normal = "sy",
            normal_cur = "syy",
            normal_line = "sY",
            normal_cur_line = "sYY",
            visual = "S",
            visual_line = "gS",
            delete = "sd",
            change = "sc",
            change_line = "sC",
        },
        highlight = {duration = 0}
    },
    config = function (_, opts)
        require("nvim-surround").setup(opts)
    end
}}
