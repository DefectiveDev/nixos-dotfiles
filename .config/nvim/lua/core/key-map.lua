local keymap = vim.keymap
keymap.set({"n", "x", "o"}, "s", "<Nop>", {nowait = true})
keymap.set({"n", "x", "o"}, "S", "<Nop>", {nowait = true})

-- % is uncomfortable using leader e may be easier
keymap.set({"n", "x", "o"}, "<leader>e", "%", {desc = "[e]quivalent match (nvim)"})

-- shift + ` is uncomfortable using leader ` may be easier
keymap.set({"n", "x", "o"}, "<leader>`", "~", {desc = "Toggle case"})

keymap.set( "n", "<leader>o", ':<C-u>call append(line("."),   repeat([""], v:count1))<CR>',  {silent = true, desc = "[o]ppend line above (nvim)"})
keymap.set( "n", "<leader>O", ':<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>',  {silent = true, desc = "[O]ppend line below (nvim)"})

-- use arrow keys more conviently
keymap.set({'i', 'c'}, "<C-L>", "<right>")
keymap.set({'i', 'c'}, "<C-H>", "<left>")
keymap.set('i', "<C-J>", "<down>")
keymap.set('i', "<C-K>", "<up>")

keymap.set('n', "<localleader>ff", "gg=G''", {desc="[f]ormat [f]ile (nvim)", silent =true})

keymap.set('n', "J", "mzJ`z", {desc = "[J]oin next line (nvim)", silent = true})

-- For matches center the window on the cursor
keymap.set('n', 'n', "nzzzv", {silent = true})
keymap.set('n', 'N', "Nzzzv", {silent = true})

keymap.set('n', '<C-j>', ":m .+1<CR> ==",{ desc = "Move line down (nvim)", silent = true})
keymap.set('n', '<C-k>', ":m .-2<CR> ==",{ desc = "Move line up (nvim)", silent = true})

keymap.set('x', '<C-k>', ":m '<-2<CR>gv=gv",{ desc = "Move line up (nvim)", silent = true})
keymap.set('x', '<C-j>', ":m '>+1<CR>gv=gv",{ desc= "Move line down (nvim)", silent = true})

keymap.set({'v','n'}, "<leader>r", "r",{ desc = "Regular [r]eplace (nvim)"})
keymap.set({'v','n'}, "<leader>x", "x",{ desc = "Regular char delete (nvim)"})
keymap.set({'v','n'}, "r", "\"_r",{ desc = "Void [r]eplace (nvim)"})
keymap.set({'v','n'}, "x", "\"_x",{ desc = "Void char delete (nvim)"})
keymap.set({'v','n'}, "<leader>d", "\"_d",{ desc = "Void [d]elete (nvim)", noremap = true})
keymap.set({'v','n'}, '<leader>c', "\"_c", {desc = "Void [c]hange (nvim)", noremap = false})
keymap.set({'v','n'}, '<leader>C', "\"_C", {desc = "Void [C]hange (nvim)", noremap = false})

keymap.set({'v','n'}, "<leader>y", "\"+y",{ desc = "[y]ank to clipboard (nvim)" })

keymap.set({'v','n'}, "<leader>p", "\"+p", {desc = "[p]aste from clipboard after cursor (nvim)"})
keymap.set({'v','n'}, "<leader>P", "\"+P", {desc = "[P]aste from clipboard before cursor (nvim)"})
keymap.set('x', "<leader>p", "\"_dh\"+p", {desc = "[p]aste from clipboard void selection (nvim)"})
keymap.set('x', "<leader>P", "\"+p", {desc = "[P]aste from clipboard copy selection (nvim)"})
keymap.set('x', 'p', "\"_dP", {desc= "[p]aste and void selection (nvim)"})
keymap.set('x', 'P', "p", {desc= "[P]aste and copy selection (nvim)"})

keymap.set('n', "<leader>k", ":cprev<CR>zz", {desc = "Quick fix select previous (nvim)"})
keymap.set('n', "<leader>j", ":cnext<CR>zz", {desc = "Quick fix select next (nvim)"})

keymap.set('n', "<leader>q", ":cclose<CR>", {desc = "[q]uick close quick fix (nvim)"})

keymap.set('', ';', ':')
keymap.set('', ':', ';')

keymap.set('n', "<leader><TAB>", ":bn<CR>", {silent = true})
keymap.set('n', "<leader><S-TAB>", ":bp<CR>", { silent = true })

keymap.set('c', "<C-k>", "<C-p>")

keymap.set('c', "<C-j>", "<C-n>")

keymap.set('n', '0', ":silent! call search('^.')<CR>^", {silent = true})

keymap.set('n', '<leader>lz', function ()
---@diagnostic disable-next-line: undefined-field
    vim.opt.lazyredraw = not vim.opt.lazyredraw:get()
---@diagnostic disable-next-line: undefined-field
    print(string.format("Lazy redraw is: %s", vim.opt.lazyredraw:get()))
end, {desc= "Toggle [l]a[z]y redraw. (nvim)"})

-- Allow me to tab over specified chars.
-- keymap.set('i', "<TAB>",function ()
--     local chars_tab_over = {'"', "'", '{', '}', '(', ')', '[', ']' }
--
--     local cur_cursor_pos = vim.fn.col(".")
--     local current_char = vim.fn.getline("."):sub(cur_cursor_pos, cur_cursor_pos)
--
--     for _, char in pairs(chars_tab_over) do
--         if current_char == char then
--             return "<right>"
--         end
--     end
--
--     return "<TAB>"
-- end, {expr = true, silent = true})

keymap.set('c', "<CR>", function ()
    if vim.fn.pumvisible() == 1 then
        return "<C-y>"
    end
    return "<CR>"
end, { expr = true })

keymap.set("n", "i", function()
    if #vim.fn.getline "." == 0 then
        return [["_cc]]
    else
        return "i"
    end
end, { expr = true })
