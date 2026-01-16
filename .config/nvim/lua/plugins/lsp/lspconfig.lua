---@diagnostic disable: undefined-field
return {{
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        -- "hrsh7th/cmp-nvim-lsp",
    },
    config = function()

        local keymap = vim.keymap -- for concisenesss
        local opts = { noremap = true, silent = true }
        -- Under language features you can find the providers! https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#languageFeatures-side
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(env)
                local bufnr = env.buf

                local client = vim.lsp.get_client_by_id(env.data.client_id)

                ---@diagnostic disable-next-line: need-check-nil
                local server_capabilities = client.server_capabilities
                opts.buffer = bufnr


                vim.api.nvim_create_autocmd({'CursorHold', 'CursorHoldI'},{
                    buffer = bufnr,
                    callback = vim.lsp.buf.document_highlight,
                })

                vim.api.nvim_create_autocmd({'CursorMoved', 'CursorMovedI'},{
                    buffer = bufnr,
                    callback = vim.lsp.buf.clear_references,
                })

                if server_capabilities.referencesProvider then
                    opts.desc = "Show LSP references"
                    keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
                end

                if server_capabilities.declarationProvider then
                    opts.desc = "Got to declaration"
                    keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                end

                if server_capabilities.definitionProvider then
                    opts.desc = "Show LSP definition"
                    keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
                end

                if server_capabilities.typeDefinitionProvider then
                    opts.desc = "Show LSP type definitions"
                    keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
                end

                if server_capabilities.implementationProvider then
                    opts.desc = "Show LSP implementations"
                    keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
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

                opts.desc = "Show workspace diagnostics"
                keymap.set("n", "gW", "<cmd>Telescope diagnostics<CR>", opts)

                opts.desc = "Show workspace diagnostics"
                keymap.set("n", "<leader>lwd", "<cmd>Telescope diagnostics<CR>", opts)

                opts.desc = "Show buffer diagnostics"
                keymap.set("n", "<leader>lD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

                opts.desc = "Show line diagnostics"
                keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)

                opts.desc = "Restart LSP"
                keymap.set("n", "<leader>lrs", "<cmd>LspRestart<CR>", opts)

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

        -- go through lsp folder and return all configs then enable them.
        local lsp_configs = {}

        for _, f in pairs(vim.api.nvim_get_runtime_file('lsp/*.lua', true)) do
            local server_name = vim.fn.fnamemodify(f, ':t:r')
            table.insert(lsp_configs, server_name)
        end

        vim.lsp.enable(lsp_configs)

    end,
},  {
        "folke/neodev.nvim",
        dependencies = "neovim/nvim-lspconfig",
        ft = {"lua"},
        config = true
    },
}

