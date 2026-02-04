return {
    "https://github.com/DefectiveDev/grapple.nvim.git",
    pin = true,
    dependencies = {  "https://github.com/nvim-tree/nvim-web-devicons.git", "https://github.com/nvim-telescope/telescope.nvim.git",},
    keys = {
        { "<leader>gt", ":Grapple toggle<cr>", desc = "[g]rapple [t]oggle add/remove a file (Grapple)", silent = true },
        { "<leader>gg", ":Telescope grapple tags<cr>", desc = "[g]et [g]rapple tags (Grapple + Telescope)", silent = true}
    },
    opts = {
        scope = "git",
        icons = true,
    },
}
