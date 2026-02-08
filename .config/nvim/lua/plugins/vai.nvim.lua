return {
    'https://github.com/johnpmitsch/vai.nvim',
    pin = true,
    keys = {{ ",", mode = {"n","x","o"}}},
    opts = {
        trigger = ",",
    },
    config = function (_, opts)
        require("vai").setup(opts)
        -- disable all Vai backgrounds
        for i = 1, 26 do
            -- local hl = vim.api.nvim_get_hl(0, {name = "VaiLabel" .. i, link=true})
            local cmd = "hi! VaiLabel" .. i .. " guibg=NONE ctermbg=NONE"
            vim.cmd(cmd)
        end

        -- disable dimming for Vai
        local cmd = "hi! VaiDim" .. " guifg=NONE ctermfg=NONE"
        vim.cmd(cmd)
    end
}
