return {
    "https://github.com/NTBBloodbath/color-converter.nvim",
    cmd = {
        "ColorConverterCycle",
        "ColorConverterHex",
        "ColorConverterRGB",
        "ColorConverterHSL",
        "ColorConverterPick",
    },
    config = function (_, opts)
        require("color-converter").setup(opts)
        vim.cmd("command! ColorConverterCycle lua require('color-converter').cycle()")
        vim.cmd("command! ColorConverterHex lua require('color-converter').to_hex()")
        vim.cmd("command! ColorConverterRGB lua require('color-converter').to_rgb()")
        vim.cmd("command! ColorConverterHSL lua require('color-converter').to_hsl()")
        vim.cmd("command! ColorConverterPick lua require('color-converter').pick()")
    end
}
