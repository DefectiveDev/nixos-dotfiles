return {
    "https://github.com/nvim-lualine/lualine.nvim.git",
	pin = true,
    dependencies = {
        "https://github.com/folke/noice.nvim.git",
        "https://github.com/nvim-tree/nvim-web-devicons.git",
        "https://github.com/NotAShelf/direnv.nvim.git",
    },
    opts = {
        options = {
            theme = "dracula",
            component_separators = { left = ' ', right = ' '},
            section_separators = { left = '', right = ''},
        },


        inactive_sections = {
            lualine_c = {
                {
                    'filename',

                    symbols = {
                        modified = ' ',      -- Text to show when the file is modified.
                        readonly = ' ',      -- Text to show when the file is non-modifiable or readonly.
                        unnamed = '[No Name]', -- Text to show for unnamed buffers.
                        newfile = '[New]',     -- Text to show for newly created file before first write
                    }
                }
            },
        },

        sections = {
            lualine_x = {
                {
                    "grapple",
                    cond = function()
                        return package.loaded["grapple"] and require("grapple").exists()
                    end
                },
                {
                    function ()
                        return require('direnv').statusline()
                    end,
                    cond = function()
                        return not (package.loaded["grapple"] and require("grapple").exists())
                    end
                },
                {
                    require("lazy.status").updates,
                    cond = require("lazy.status").has_updates,
                    color = { fg = "#FFCA80" }, --orange
                },
            },
            lualine_y = {
                {
                    function ()
                        return require('direnv').statusline()
                    end,
                    cond = function()
                        return package.loaded["grapple"] and require("grapple").exists()
                    end
                },
                { "filetype" },
            },
            lualine_z = {'location'}
        },
    },
    config = function(_, opts)
        local lualine = require("lualine")

        local rec_msg = ''
        local rec_opts = vim.tbl_deep_extend('keep', opts, {
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

        local filename_opts = vim.tbl_deep_extend('keep', opts, {
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
