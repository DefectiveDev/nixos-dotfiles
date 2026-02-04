local open_current_directory = function(prompt_bufnr)
    local fb_utils = require("telescope._extensions.file_browser.utils")
    local action_state = require("telescope.actions.state")
    local current_picker = action_state.get_current_picker(prompt_bufnr)
    local finder = current_picker.finder
    finder.path = vim.fn.expand("#:p:h")

    fb_utils.redraw_border_title(current_picker)
    current_picker:refresh(
        finder,
        { new_prefix = fb_utils.relative_path_prefix(finder), reset_prompt = true, multi = current_picker._multi }
    )
end
return {
    "https://github.com/nvim-telescope/telescope-file-browser.nvim.git",
    pin = true,
    keys = {{"<leader>fe", "<cmd>Telescope file_browser<cr>", desc = "[f]ile [e]xplorer (File-Browser-Telescope)"}},
    cmd = "Telescope file_browser",
    dependencies = { "https://github.com/nvim-telescope/telescope.nvim.git" },
    specs = {
        "https://github.com/nvim-telescope/telescope.nvim.git",
        opts = {
            extensions = {
                file_browser = {
                    hijack_netrw = true,
                    layout_strategy = "vertical",
                    grouped = true,
                    auto_depth = true,
                    mappings = {
                        ["i"] = {
                            ["<C-g>"] = open_current_directory,
                            ["<C-p>"]= require "telescope._extensions.file_browser.actions".goto_parent_dir
                        },
                        ["n"] = {
                            ["g"] =  open_current_directory,
                            ["p"]= require "telescope._extensions.file_browser.actions".goto_parent_dir
                        },
                    }
                },
            }
        }
    },
    init = function()
        if vim.fn.argc() == 1 then
            ---@diagnostic disable-next-line: param-type-mismatch
            local stat = vim.loop.fs_stat(vim.fn.argv(0))
            if stat and stat.type == "directory" then
                require("lazy").load({plugins = {"telescope-file-browser.nvim"}})
            end
        end
    end,
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        require("telescope").load_extension("file_browser")
    end
}
