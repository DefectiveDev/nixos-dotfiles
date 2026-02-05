return {
    'https://github.com/Wansmer/treesj.git',
	pin = true,
    keys = { { "<leader>m", function() require("treesj").toggle() end, desc = "Toggle [m]ember block (treesj)" }, },
    cmd = {"TSJToggle", "TSJSplit", "TSJJoin"},
    dependencies = { 'https://github.com/nvim-treesitter/nvim-treesitter.git' },
    opts = { use_default_keymaps = false, max_join_length = 9999 }
}
