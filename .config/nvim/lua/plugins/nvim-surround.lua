return {{
    -- "kylechui/nvim-surround",
    -- Custom fork to handle highlight
    "DefectiveDev/nvim-surround-highlights",
    keys = {
        { "sy", desc = "Add a [s]urrounding pair around a motion (surround)" },
        { "sY", desc = "Add a [s]urrounding pair around a motion, on new lines (surround)" },
        { "sd", desc = "[s]urrounding pair [d]elete (surround)"},
        { "sc", desc = "[s]urrounding pair [c]hange (surround)"},
        { "sC", desc = "[s]urrounding pair [C]hange, putting replacements on new lines (surround)"},
        { "<C-g>s", mode = "i", desc = "[s]urrounding pair around the cursor (surround)" },
        { "<C-g>S", mode = "i", desc = "[S]urrounding pair around the cursor, on new lines (surround)" },
        { "S", mode = "x", desc = "[s]urrounding pair around a visual selection (surround)" },
        { "gS", mode = "x", desc = "[g]o add [S]urrounding pair around a visual selection, on new lines" },
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
