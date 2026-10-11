local opt = vim.opt
-- set <Leader> key to space
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

--use same bar for all buffers
opt.laststatus = 3
opt.confirm = true
-- completion menu
opt.completeopt = "menu,menuone"
-- relative line numbers
opt.relativenumber = true
opt.nu = true
-- use system clipboard
-- copy previous line's indent
opt.copyindent = true
opt.smartindent = true
-- highlight cursor column
opt.cursorcolumn = true
-- enable line highlight
opt.cursorline = true
-- set line to go across line and number
opt.cursorlineopt= "both"
-- ignore case in searches by default
opt.ignorecase = true
-- set how many spaces a tab makes (no expand tab means it will create a tab on 8)
opt.tabstop = 4
opt.expandtab = true
-- how many spaces >> inserts
opt.shiftwidth = 4
-- disable word wrap
opt.wrap = false

opt.list = true
opt.listchars:append "eol:$"

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8

opt.signcolumn = "yes"

opt.updatetime = 1000;

opt.swapfile = false
opt.backup = false
---@diagnostic disable-next-line: assign-type-mismatch
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.splitright = true

vim.api.nvim_create_autocmd("TextYankPost", {
    command = ":silent! lua vim.hl.on_yank({timeout=250})"
})

vim.api.nvim_create_user_command("CDC", "cd %:p:h", {})

opt.spelllang = "en_us"
opt.spell = true

-- Causes issue with markdown menus from other plugins

-- vim.api.nvim_create_autocmd("FileType", {
--     group = vim.api.nvim_create_augroup("MarkdownSoftWrapText", {}),
--     desc = "In a markdown file wrap text so it will match other text editors",
--     pattern = "markdown",
--     callback = function()
--         vim.bo.textwidth = 0
--         vim.bo.wrapmargin = 0
--         vim.b.prevwrap = vim.wo.wrap
--         vim.wo.wrap = true
--         vim.b.prevlinebreak = vim.wo.linebreak
--         vim.wo.linebreak = true
--         vim.b.prevcolumns = vim.go.columns
--         vim.go.columns = 80
--     end,
-- })
--
-- vim.api.nvim_create_autocmd("BufLeave", {
--     group = vim.api.nvim_create_augroup("ExitMarkdownSoftWrapText", {}),
--     desc = "In a markdown file wrap text so it will match other text editors, on exit undo settings",
--     pattern = "*",
--     callback = function ()
--         if vim.bo.filetype == "markdown" then
--             vim.wo.wrap=vim.b.prevwrap
--             vim.wo.linebreak=vim.b.prevlinebreak
--             vim.go.columns=vim.b.prevcolumns
--         end
--     end
-- })
