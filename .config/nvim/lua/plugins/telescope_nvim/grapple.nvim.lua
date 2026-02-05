return {
    "https://github.com/DefectiveDev/grapple.nvim.git",
    pin = true,
    dependencies = {  "https://github.com/nvim-tree/nvim-web-devicons.git", },
    keys = { { "<leader>gt", ":Grapple toggle<cr>", desc = "[g]rapple [t]oggle add/remove a file (Grapple)", silent = true } },
    opts = { scope = "git", icons = true },
    specs = {
        "https://github.com/nvim-telescope/telescope.nvim.git",
        cmd = {"Telescope"},
        specs = {{
            "https://github.com/DefectiveDev/grapple.nvim.git",
            keys = { { "<leader>gg", ":Telescope grapple tags<cr>", desc = "[g]et [g]rapple tags (Grapple + Telescope)", silent = true } }
        }}
    }
}
