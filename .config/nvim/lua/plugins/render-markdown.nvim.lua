return {
    "https://www.github.com/meanderingprogrammer/render-markdown.nvim.git",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    event = "VeryLazy",
    keys = {
        { "<leader>mr", function() require("render-markdown").buf_toggle() end, desc = "Toggle [m]arkdown [r]ender" },
    },
    ---@module "render-markdown"
    ---@type render.md.UserConfig
    opts = {
        win_options = { conceallevel = { default = 0 } },
        completions = { lsp = { enabled = true } },
        heading = {
            icons = { '󰬺  ', '󰬻  ', '󰬼  ', '󰬽  ', '󰬾  ', '󰬿  ' },
            position = 'inline',
        },
        render_modes = {'n'},
    },
}
