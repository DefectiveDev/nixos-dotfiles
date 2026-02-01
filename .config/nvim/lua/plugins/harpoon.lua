return {
    "ThePrimeagen/harpoon",
    keys = {
        {"<leader>hh", function() require('harpoon.ui').toggle_quick_menu() end, desc = "[h]arpoon [m]enu (harpoon)"},
        {"<leader>ha", function() require('harpoon.mark').add_file() end, desc = "[h]arpoon [a]dd file (harpoon)"},
    },
    opts = {},
}
