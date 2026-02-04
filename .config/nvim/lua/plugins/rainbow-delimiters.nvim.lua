return {
    "https://github.com/HiPhish/rainbow-delimiters.nvim.git",
    pin = true,
    dependencies = "https://github.com/nvim-treesitter/nvim-treesitter.git",
    lazy = false,
    main = "rainbow-delimiters.setup",
    -- BUG: first demlimiter is always white
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
