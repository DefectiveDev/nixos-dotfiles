return {
    -- "https://github.com/kylechui/nvim-surround.git",
    -- Custom fork to handle highlight
    "https://github.com/DefectiveDev/nvim-surround-highlights.git",
    pin = true,
    keys = {
        { "sy", '<Plug>(nvim-surround-normal)',  desc = "[s]urrounding pair [y]ield around a motion (nvim-surround)" },
        { "syy", '<Plug>(nvim-surround-normal-cur)',  desc = "[s]urrounding pair [yy]ield around a motion on the current line (nvim-surround)" },
        { "sY", '<Plug>(nvim-surround-normal-line)',  desc = "[s]urrounding pair [Y]ield around a motion, on new lines (nvim-surround)" },
        { "sYY", '<Plug>(nvim-surround-normal-cur-line)',  desc = "[s]urrounding pair [YY]ield around a motion, on current lines (nvim-surround)" },
        { "sd", '<Plug>(nvim-surround-delete)',  desc = "[s]urrounding pair [d]elete (nvim-surround)"},
        { "sc", '<Plug>(nvim-surround-change)',  desc = "[s]urrounding pair [c]hange (nvim-surround)"},
        { "sC", '<Plug>(nvim-surround-change-line)',  desc = "[s]urrounding pair [C]hange, putting replacements on new lines (nvim-surround)"},
        { "<C-g>s", '<Plug>(nvim-surround-insert)',  mode = "i", desc = "Add a [s]urrounding pair around the cursor (nvim-surround)" },
        { "<C-g>S", '<Plug>(nvim-surround-insert-line)',  mode = "i", desc = "Add a [S]urrounding pair around the cursor, on new lines (nvim-surround)" },
        { "S", '<Plug>(nvim-surround-visual)',  mode = "x", desc = "Add a [S]urrounding pair around a visual selection (nvim-surround)" },
        { "gS", '<Plug>(nvim-surround-visual-line)',  mode = "x", desc = "[g]enerate a [S]urrounding pair around a visual selection, on new lines (nvim-surround)" },
    },
    opts = {
        keymaps = {
            insert = false,
            insert_line = false,
            normal = false,
            normal_cur = false,
            normal_line = false,
            normal_cur_line = false,
            visual = false,
            visual_line = false,
            delete = false,
            change = false,
            change_line = false,
        },
        highlight = {duration = 0}
    },
}
