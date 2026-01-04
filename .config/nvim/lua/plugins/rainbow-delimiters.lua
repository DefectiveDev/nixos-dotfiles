return {
    "HiPhish/rainbow-delimiters.nvim",
    -- tag = "v0.10.0",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
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
    }
}
