return  {
    "https://github.com/willothy/nvim-cokeline.git",
    pin = true,
    dependencies = {
        "https://github.com/nvim-lua/plenary.nvim.git",        -- Required for v0.4.0+
        "https://github.com/nvim-tree/nvim-web-devicons.git", -- If you want devicons
        "https://github.com/stevearc/resession.nvim.git"       -- Optional, for persistent history
    },
    opts = {

        default_hl = {
            ---@type nil | string | fun(buffer: Buffer): string
            fg = function(buffer)
                local hlgroups = require("cokeline.hlgroups")
                return buffer.is_focused and hlgroups.get_hl_attr("Normal", "fg")
                    or hlgroups.get_hl_attr("ColorColumn", "bg")
            end,
        }

    }
}
