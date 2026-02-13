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
            filter =  function (buf, win)
                local filter = vim.g.snacks_indent ~= false and vim.b[buf].snacks_indent ~= false and vim.bo[buf].buftype == ""
                filter = vim.bo[buf].filetype ~= "org" and filter
                return filter
            end
        }
    }
}
