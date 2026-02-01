return {
    "DefectiveDev/grapple.nvim",
    dependencies = {  "nvim-tree/nvim-web-devicons", "nvim-telescope/telescope.nvim",},
    keys = {
        { "<leader>gt", ":Grapple toggle<cr>", desc = "[g]rapple [t]oggle add/remove a file (Grapple)", silent = true },
        { "<leader>gg", ":Telescope grapple tags<cr>", desc = "[g]et [g]rapple tags (Grapple + Telescope)", silent = true}
    },
    opts = {
        scope = "git",
        icons = true,
    },
}
