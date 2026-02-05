return {
    "https://github.com/kkharji/sqlite.lua.git",
    lazy = true,
    config = function ()
        vim.api.nvim_set_var("sqlite_clib_path", os.getenv("SQLITE_PATH"))
    end
}
