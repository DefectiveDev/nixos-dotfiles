return  {
    "willothy/nvim-cokeline",
    dependencies = {
        "nvim-lua/plenary.nvim",        -- Required for v0.4.0+
        "nvim-tree/nvim-web-devicons", -- If you want devicons
        "stevearc/resession.nvim"       -- Optional, for persistent history
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
