return {
    "https://github.com/nvim-orgmode/orgmode",
    event = "VeryLazy",
    keys = {
        -- continue list when pressing shift + enter
        {"<S-CR>", function() require("orgmode").action("org_mappings.meta_return") end, mode = "i", ft = "org"},
    },
    -- TODO: Change all default keymaps. They require <leader> o and this conflicts with my add line in normal mode
    opts = {
        org_agenda_files = "~/Documents/orgfiles/**/*",
        org_default_notes_file = "~/Documents/orgfiles/refile.org",
        mappings = {
            prefix = "<leader>n",
            global = {
                org_agenda = "<localleader>oa",
                org_capture = "<localleader>oc"
            }
        },
        -- Forces use of ui select
        ui = {
            menu = {
                handler = function(data)
                    -- your handler here, for example:
                    local options = {}
                    local options_by_label = {}

                    for _, item in ipairs(data.items) do
                        -- Only MenuOption has `key`
                        -- Also we don't need `Quit` option because we can close the menu with ESC
                        if item.key and item.label:lower() ~= "quit" then
                            table.insert(options, item.label)
                            options_by_label[item.label] = item
                        end
                    end

                    local handler = function(choice)
                        if not choice then
                            return
                        end

                        local option = options_by_label[choice]
                        if option.action then
                            option.action()
                        end
                    end

                    vim.ui.select(options, {
                        propmt = data.propmt,
                    }, handler)
                end,
            },
        },
    },
    config = function(_, opts)
        -- Setup orgmode
        require("orgmode").setup(opts)
        -- Experimental LSP support
        vim.lsp.enable("org")
    end,
    specs = {{
        "https://github.com/saghen/blink.cmp.git",
        opts = {
            sources = {
                per_filetype = {
                    org = {'orgmode'}
                },
                providers = {
                    orgmode = {
                        name = 'Orgmode',
                        module = 'orgmode.org.autocompletion.blink',
                        fallbacks = { 'buffer' },
                    },
                },
            }
        }
    }}
}
