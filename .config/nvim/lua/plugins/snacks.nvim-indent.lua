return {
    "https://github.com/folke/snacks.nvim.git",
    init = function ()
        local colors = require("dracula").colors()
		vim.api.nvim_set_hl(0, "SnacksIndent", {fg = colors.cyan})
		vim.api.nvim_set_hl(0, "SnacksIndentScope", {fg = colors.pink})
    end,
    ---@type snacks.Config
    opts = {
        indent = {
            enabled =true,
            animate = { enabled = false },
            scope = { only_current = true },
        }
    }
}
