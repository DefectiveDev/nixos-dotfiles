return {
    "https://github.com/HiPhish/rainbow-delimiters.nvim.git",
    pin = true,
    dependencies = "https://github.com/nvim-treesitter/nvim-treesitter.git",
    lazy = true,
    main = "rainbow-delimiters.setup",
    opts = {
        strategy = {
            [''] = 'rainbow-delimiters.strategy.global',
            -- commonlisp = 'rainbow-delimiters.strategy.local',
        },
        query = {
            [''] = 'rainbow-delimiters',
            -- latex = 'rainbow-blocks',
        },
        priority = {
            -- c_sharp = 210,
        },
        highlight = {
            'RainbowDelimiterRed',
            'RainbowDelimiterYellow',
            'RainbowDelimiterBlue',
            'RainbowDelimiterOrange',
            'RainbowDelimiterGreen',
            'RainbowDelimiterViolet',
            'RainbowDelimiterCyan',
        },
        -- blacklist = {'c', 'cpp'},
    },
    config = function (_, opts)
        local colors = require("dracula").colors()
		vim.api.nvim_set_hl(0, "RainbowDelimiterRed", {fg = colors.red})
		vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", {fg = colors.yellow})
		vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", {fg = colors.bright_blue})
		vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", {fg = colors.orange})
		vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", {fg = colors.green})
		vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", {fg = colors.purple})
		vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", {fg = colors.cyan})
        require("rainbow-delimiters.setup").setup(opts)
    end,
    specs = {{
        "https://github.com/nvim-treesitter/nvim-treesitter.git",
        config = function ()
            require("lazy").load({plugins = {"rainbow-delimiters.nvim"}})
        end
    }}
}
