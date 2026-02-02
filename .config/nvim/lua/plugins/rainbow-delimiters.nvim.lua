return {
    "https://github.com/HiPhish/rainbow-delimiters.nvim.git",
    -- tag = "v0.10.0",
    dependencies = "https://github.com/nvim-treesitter/nvim-treesitter.git",
    -- event = "VeryLazy",
    lazy = false,
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
