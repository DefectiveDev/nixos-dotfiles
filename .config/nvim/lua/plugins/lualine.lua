return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "folke/noice.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local lualine = require("lualine")
        local lazy_status = require("lazy.status")

        local base_opts = {
            options = {
                theme = "dracula",
                component_separators = { left = '|', right = '|'},
                section_separators = { left = '', right = ''},
            },
            sections = {
                lualine_x = {
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        color = { fg = "#FFCA80" }, --orange
                    },
                    {
                        function ()
                            return require('direnv').statusline()
                        end
                    }
                },
                lualine_y = { { "filetype" }, },
                lualine_z = {'location'}
            },
        }


        local rec_msg = ''
        local rec_opts = vim.tbl_deep_extend('keep', base_opts, {
            sections = {
                lualine_c = {
                    {
                        function ()
                            return rec_msg
                        end,
                        color = { fg = "#FFCA80" }, --orange
                    }
                }
            }
        })

        local filename_opts = vim.tbl_deep_extend('keep', base_opts, {
            sections = {
                lualine_c = {
                    {
                        'filename',
                        file_status = true,      -- Displays file status (readonly status, modified status)
                        newfile_status = false,  -- Display new file status (new file means no write after created)
                        path = 0,                -- 0: Just the filename
                        -- 1: Relative path
                        -- 2: Absolute path
                        -- 3: Absolute path, with tilde as the home directory
                        -- 4: Filename and parent dir, with tilde as the home directory

                        shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
                        -- for other components. (terrible name, any suggestions?)
                        -- It can also be a function that returns
                        -- the value of `shorting_target` dynamically.
                        symbols = {
                            modified = ' ',      -- Text to show when the file is modified.
                            readonly = ' ',      -- Text to show when the file is non-modifiable or readonly.
                            unnamed = '[No Name]', -- Text to show for unnamed buffers.
                            newfile = '[New]',     -- Text to show for newly created file before first write
                        }
                    }
                }
            }
        })

        vim.api.nvim_create_autocmd({ 'RecordingEnter', 'RecordingLeave' }, {
            group = vim.api.nvim_create_augroup('LualineRecordingSection', { clear = true }),
            callback = function(e)
                if e.event == 'RecordingLeave' then
                    rec_msg = ''
                    lualine.setup(filename_opts)
                else
                    rec_msg = 'recording @' .. vim.fn.reg_recording()
                    lualine.setup(rec_opts)
                end
            end,
        })

        lualine.setup(filename_opts)
    end
}
