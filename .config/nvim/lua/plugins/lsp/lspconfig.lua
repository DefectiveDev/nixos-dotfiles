return {{
    "neovim/nvim-lspconfig",
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


                -- TODO: move telescope dependent keymaps to telescope lua file

                opts.desc = "Show workspace diagnostics"
                keymap.set("n", "<leader>lwd", function() require("telescope.builtin").diagnostics() end, opts)

                opts.desc = "Show buffer diagnostics"
                keymap.set("n", "<leader>lD", function() require("telescope.builtin").diagnostics({bufnr=0}) end, opts)

                opts.desc = "Show line diagnostics"
                keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)

                opts.desc = "Restart LSP"
                keymap.set("n", "<leader>lrs", "<cmd>LspRestart<CR>", opts)

                local client = vim.lsp.get_client_by_id(env.data.client_id)

                -- -- lsp return if client not present
                if not client then
                    return
                end

                ---@diagnostic disable-next-line: undefined-field
                local server_capabilities = client.server_capabilities

                if not server_capabilities then
                    return
                end

                if server_capabilities.referencesProvider then
                    opts.desc = "Show LSP references (Telescope)"
                    keymap.set("n", "gR", function() require("telescope.builtin").lsp_references() end, opts)
                end

                if server_capabilities.declarationProvider then
                    opts.desc = "Got to declaration"
                    keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                end

                if server_capabilities.definitionProvider then
                    opts.desc = "Show LSP definition (Telescope)"
                    keymap.set("n", "gd", function() require("telescope.builtin").lsp_definitions() end, opts)
                end

                if server_capabilities.typeDefinitionProvider then
                    opts.desc = "Show LSP type definitions (Telescope)"
                    keymap.set("n", "gt", function() require("telescope.builtin").lsp_type_definitions() end, opts)
                end

                if server_capabilities.implementationProvider then
                    opts.desc = "Show LSP implementations (Telescope)"
                    keymap.set("n", "gi", function() require("telescope.builtin").lsp_implementations() end, opts)
                end

                if server_capabilities.codeActionProvider then
                    opts.desc = "See available code actions"
                    keymap.set({ "n", "v" }, "<leader>lc", vim.lsp.buf.code_action, opts)
                end

                if server_capabilities.renameProvider then
                    opts.desc = "Smart rename"
                    keymap.set("n", "<leader>lrn", vim.lsp.buf.rename, opts)
                end

                if server_capabilities.hoverProvider then
                    opts.desc = "Show documentation for what is under cursor"
                    keymap.set("n", "K", vim.lsp.buf.hover, opts)
                end

                if server_capabilities.signatureHelpProvider then
                    opts.desc = "Show signature help"
                    keymap.set('n', "gK", vim.lsp.buf.signature_help, opts)
                    keymap.set('i', "<C-s>", vim.lsp.buf.signature_help, opts)
                end

                if server_capabilities.inlayHintProvider then
                    vim.lsp.inlay_hint.enable(true, {bufnr = bufnr})
                    opts.desc = "Toggle inlay hints"
                    keymap.set("n", "<leader>li",
                    function()
                        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({bufnr = bufnr}), { bufnr = bufnr})
                    end,
                    opts)
                end

                if server_capabilities.workspaceSymbolProvider then
                    opts.desc = "Show workspace document symbols (Telescope)"
                    keymap.set("n", "<leader>fwd", function() require("telescope.builtin").lsp_workspace_symbols() end, opts)
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
            root_markers = { 'flake.nix' }
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
}}

