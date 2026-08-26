return {
    "https://github.com/chipsenkbeil/org-roam.nvim.git",
    tag = "0.2.0",
    dependencies = { { "nvim-orgmode/orgmode" } },
    -- TODO: check with conflicting keymaps with orgmode file.
    opts = {
        directory = "~/org_roam_files",
        -- optional
        org_files = {
            "~/another_org_dir",
            "~/some/folder/*.org",
            "~/a/single/org_file.org",
        }
    },
    specs = {
        "https://github.com/nvim-orgmode/orgmode",
        tag = "0.7.0",
    }
}
