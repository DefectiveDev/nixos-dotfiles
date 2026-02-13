return {
    "chipsenkbeil/org-roam.nvim",
    tag = "0.2.0",
    dependencies = { { "nvim-orgmode/orgmode" } },
    config = function()
        require("org-roam").setup({
            directory = "~/org_roam_files",
            -- optional
            org_files = {
                "~/another_org_dir",
                "~/some/folder/*.org",
                "~/a/single/org_file.org",
            }
        })
    end
}
