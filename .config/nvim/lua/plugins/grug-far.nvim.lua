return {
    'https://github.com/MagicDuck/grug-far.nvim',
    -- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
    -- additional lazy config to defer loading is not really needed...
    opts = {
        headerMaxWidth = 80,
        startInInsertMode = false,
        transient = true,
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
                    },
                })
            end,
            mode = { "n", "x" },
            desc = "[s]earch and [r]eplace (grug-far)",
        },
    },
    specs = {
        "stevearc/oil.nvim",
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
