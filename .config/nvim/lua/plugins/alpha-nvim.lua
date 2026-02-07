return {
    "https://github.com/goolord/alpha-nvim.git",
    pin = true,
    dependencies = { "https://github.com/nvim-tree/nvim-web-devicons.git" },
    event = "VimEnter",
    cond = function ()
        if vim.fn.argc(-1) == 0 then
            return true
        end
    end,
    init = false,
    opts = function ()
        local dashboard = require('alpha.themes.dashboard')

        dashboard.section.buttons.val = {
            dashboard.button( "e", "  New file" , ":Oil<CR>"),
            dashboard.button( "f", "󰈞  Find file", ":Telescope find_files<CR>"),
            dashboard.button( "r", "  Recent"   , ":Telescope oldfiles<CR>"),
            dashboard.button( "g", "󰈬  Find Word"   , ":Telescope live_grep<CR>"),
            dashboard.button( "p", "  Jump to project"   , ":Telescope projects<CR>"),
            dashboard.button( "q", "  Quit NVIM", ":qa<CR>"),
        }
        return dashboard
    end,
    config = function (_, dashboard)
        require('alpha').setup(dashboard.config)
        -- Disable folding on alpha buffer
        vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
    end
};
