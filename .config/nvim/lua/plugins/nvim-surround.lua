return {{
    "kylechui/nvim-surround",
    keys = {
        { "sy", desc = "test" },
        "sd",
        "sc"
    },
    version ="^3.0.0",
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
},
{ "XXiaoA/ns-textobject.nvim", enabled = false, keys = { "ys", "ds", "cs",}, dependencies = {"kylechui/nvim-surround"}, opts = {}}}
