return {
    'https://github.com/MagicDuck/grug-far.nvim.git',
    -- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
    -- additional lazy config to defer loading is not really needed...
    lazy = false,
    opts = {
        headerMaxWidth = 80,
        startInInsertMode = false,
        transient = true,
        engine = "ripgrep"
    },
    cmd = { "GrugFar", "GrugFarWithin" },
    keys = {
        {
            "<leader>sr",
            function()
                local grug = require("grug-far")
                local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
                grug.open({
                    prefills = {
                        filesFilter = ext and ext ~= "" and "*." .. ext or nil,
                        flags = ''
                    },

                })
            end,
            mode = { "n", "x" },
            desc = "[s]earch and [r]eplace (grug-far)",
        },
    },
    config = function (_, opts)
        require("grug-far").setup(opts)
        vim.api.nvim_create_autocmd('FileType', {
            group =  vim.api.nvim_create_augroup('my-grug-far-custom-keybinds', { clear = true }),
            pattern = { 'grug-far' },
            callback = function()
                vim.keymap.set('n', '<localleader>d', function()
                    local state = unpack(require('grug-far').get_instance(0):toggle_flags({ '--fixed-strings' }))
                    vim.notify('grug-far: toggled --fixed-strings ' .. (state and 'ON' or 'OFF'))
                end, { buffer = true, desc ="[d]ial toggle --fixed-strings"})
            end,
        })
    end,
    specs = {
        "https://github.com/stevearc/oil.nvim.git",
        opts = {
            keymaps = {
                -- create a new mapping, gs, to search and replace in the current directory
                ["<leader>sr"] = {
                    callback = function()
                        -- get the current directory
                        local prefills = { paths = require("oil").get_current_dir() }

                        local grug_far = require "grug-far"
                        -- instance check
                        if not grug_far.has_instance "explorer" then
                            grug_far.open {
                                instanceName = "explorer",
                                prefills = prefills,
                                staticTitle = "Find and Replace from Explorer",
                            }
                        else
                            grug_far.get_instance('explorer'):open()
                            -- updating the prefills without clearing the search and other fields
                            grug_far.get_instance('explorer'):update_input_values(prefills, false)
                        end
                    end,
                    desc = "[s]earch and [r]eplace (grug-far)",
                },
            },
        }
    },
}
