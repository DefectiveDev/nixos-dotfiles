return {
    "https://www.github.com/meanderingprogrammer/render-markdown.nvim.git",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    ---@module "render-markdown"
    ---@type render.md.UserConfig
    opts = {
        completions = { lsp = { enabled = true } },
        render_modes = {'n'},
    },
}
