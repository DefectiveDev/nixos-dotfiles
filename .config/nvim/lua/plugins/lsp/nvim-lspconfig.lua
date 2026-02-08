return {
    "https://github.com/neovim/nvim-lspconfig.git",
    pin = false,
    event = {"BufReadPre", "BufNewFile"},
    config = function()
        -- Under language features you can find the providers! https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#languageFeatures-side
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(env)
                local keymap = vim.keymap -- for concisenesss
                local opts = { noremap = true, silent = true }
                local bufnr = env.buf

                opts.buffer = bufnr

                vim.api.nvim_create_autocmd({'CursorHold', 'CursorHoldI'},{
                    buffer = bufnr,
                    callback = vim.lsp.buf.document_highlight,
                })

                vim.api.nvim_create_autocmd({'CursorMoved', 'CursorMovedI'},{
                    buffer = bufnr,
                    callback = vim.lsp.buf.clear_references,
                })

                local client = vim.lsp.get_client_by_id(env.data.client_id)

                opts.desc = "Show [l]ine [d]iagnostics (nvim)"
                keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)

                opts.desc = "[l]SP [r]e[s]tart (nvim)"
                keymap.set("n", "<leader>lrs", "<cmd>LspRestart<CR>", opts)

                -- -- lsp return if client not present
                if not client then
                    return
                end

                ---@diagnostic disable-next-line: undefined-field
                local server_capabilities = client.server_capabilities

                if not server_capabilities then
                    return
                end

                if server_capabilities.declarationProvider then
                    opts.desc = "[g]o to [d]eclaration (nvim)"
                    keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                end

                if server_capabilities.codeActionProvider then
                    opts.desc = "[l]SP available [c]ode actions (nvim)"
                    keymap.set({ "n", "v" }, "<leader>lc", vim.lsp.buf.code_action, opts)
                end

                if server_capabilities.renameProvider then
                    opts.desc = "[l]SP [r]e[n]ame (nvim)"
                    keymap.set("n", "<leader>lrn", vim.lsp.buf.rename, opts)
                end

                if server_capabilities.hoverProvider then
                    opts.desc = "Show documentation for what is under [K]ursor (nvim)"
                    keymap.set("n", "K", vim.lsp.buf.hover, opts)
                end

                if server_capabilities.signatureHelpProvider then
                    opts.desc = "[g]et signature [K]nowledge (nvim)"
                    keymap.set('n', "gK", vim.lsp.buf.signature_help, opts)
                    opts.desc = "Get signature knowledge (nvim)"
                    keymap.set('i', "<C-s>", vim.lsp.buf.signature_help, opts)
                end

                if server_capabilities.inlayHintProvider then
                    vim.lsp.inlay_hint.enable(true, {bufnr = bufnr})
                    opts.desc = "Toggle [l]SP [i]nlay hints"
                    keymap.set("n", "<leader>li",
                    function()
                        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({bufnr = bufnr}), { bufnr = bufnr})
                    end,
                    opts)
                end
            end
        })

        --- Change the Diagnostic symbols in the sign column (gutter)
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = " ";
                    [vim.diagnostic.severity.WARN] = " ";
                    [vim.diagnostic.severity.HINT] = "󱐋 ";
                    [vim.diagnostic.severity.INFO] = " ";
                }
            }
        })

        -- This is the default lsp config. If any configuration has been defined this will be overrided
        vim.lsp.config('*', {
            root_markers = { '.envrc' }
        })

        -- this enables only LSPs in our config path
        local lsp_dir = vim.fn.stdpath("config") .. "/after/lsp"
        local lsp_servers = {}

        if vim.fn.isdirectory(lsp_dir) == 1 then
            for _, file in ipairs(vim.fn.readdir(lsp_dir)) do
                if file:match("%.lua$") and file ~= "init.lua" then
                    local server_name = file:gsub("%.lua$", "")
                    table.insert(lsp_servers, server_name)
                end
            end
        end

        vim.lsp.enable(lsp_servers)
        -- this enables ALL possible configs
        -- local lsp_configs = {}
        --
        -- for _, f in pairs(vim.api.nvim_get_runtime_file('lsp/*.lua', true)) do
        --     local server_name = vim.fn.fnamemodify(f, ':t:r')
        --     table.insert(lsp_configs, server_name)
        -- end
        --
        -- vim.lsp.enable(lsp_configs)

    end,
}
