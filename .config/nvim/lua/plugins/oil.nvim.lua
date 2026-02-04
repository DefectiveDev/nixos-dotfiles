local open_in_oil = function (prompt_bufnr)
    local fb_utils = require("telescope._extensions.file_browser.utils")
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    local Path = require("plenary.path")
    local current_picker = action_state.get_current_picker(prompt_bufnr)
    local finder = current_picker.finder
    local selections = fb_utils.get_selected_files(prompt_bufnr, false)
    local parent_dir = Path:new(current_picker.finder.path):parent()
    local command = ""

    if not vim.tbl_isempty(selections) then
        fb_utils.notify("action.oil", { msg = "Multi selection is not supported!", level = "WARN" })
    else
        local entry = action_state.get_selected_entry()
        if not entry then
            fb_utils.notify("action.oil", { msg = "No selection to open in oil!", level = "WARN" })
            return
        end
        local old_path = entry.Path
        -- "../" aka parent_dir more common so test first
        if old_path.filename == parent_dir.filename then
            actions.close(prompt_bufnr)
            command = string.format("Oil %s", finder.path)
            vim.cmd(command)
            return
        end

        if not entry.is_dir then
            actions.close(prompt_bufnr)
            command = string.format("Oil %s", entry.Path:parent())
            vim.cmd(command)
            return
        end

        actions.close(prompt_bufnr)
        command = string.format("Oil %s", entry.path)
        vim.cmd(command)
    end
end
return {
    "https://github.com/stevearc/oil.nvim.git",
    pin = true,
    dependencies = { "https://github.com/nvim-tree/nvim-web-devicons.git", },
    ---@module 'oil'
    ---@type oil.SetupOpts
    cmd = {"Oil"},
    keys = { { "-", "<CMD>Oil<CR>", desc= "Open parent directory (Oil)" } },
    opts = {
        view_options = {
            is_hidden_file = function(name, bufnr)
                return name ~= ".." and vim.startswith(name, ".")
            end,
        },
        keymaps = {
            ["g?"] = { "actions.show_help", mode = "n" },
            ["<CR>"] = "actions.select",
            ["<C-s>"] = { "actions.select", opts = { vertical = true } },
            ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
            ["<C-t>"] = { "actions.select", opts = { tab = true } },
            ["<C-p>"] = "actions.preview",
            ["<C-c>"] = { "actions.close", mode = "n" },
            ["<C-l>"] = "actions.refresh",
            ["-"] = { "actions.parent", mode = "n" },
            ["_"] = { "actions.open_cwd", mode = "n" },
            ["`"] = { "actions.cd", mode = "n" },
            ["g~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
            ["gs"] = { "actions.change_sort", mode = "n" },
            ["gx"] = "actions.open_external",
            ["g."] = { "actions.toggle_hidden", mode = "n" },
            ["g\\"] = { "actions.toggle_trash", mode = "n" },
        }
    },
    specs = {
        "https://github.com/nvim-telescope/telescope-file-browser.nvim.git",
        specs = {
            "https://github.com/nvim-telescope/telescope.nvim.git",
            opts = {
                extensions = {
                    file_browser = {
                        mappings = {
                            ["i"] = {
                                ["<A-o>"] = open_in_oil
                            }
                        }
                    },
                }
            }
        }
    },
    -- Optional dependencies
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    -- lazy = false,
}
