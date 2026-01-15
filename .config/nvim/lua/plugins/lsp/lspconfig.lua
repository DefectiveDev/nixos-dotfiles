---@diagnostic disable: undefined-field
return {{
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        -- "hrsh7th/cmp-nvim-lsp",
        { "williamboman/mason-lspconfig.nvim", enabled = function ()
            if vim.env.NIX_PATH then
                return false
            end
            return true
        end,
        dependencies = "williamboman/mason.nvim", opts = {automatic_installation = true,}}
    },
    config = function()
        local lspconfig = vim.lsp.config

        -- local cmp_nvim_lsp = require("cmp_nvim_lsp")
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

                --- toggle inlay hints
                -- vim.g.inlay_hints_visible = false
                -- local function toggle_inlay_hints()
                --     if vim.g.inlay_hints_visible then
                --         vim.g.inlay_hints_visible = false
                --         vim.lsp.inlay_hint(bufnr, false)
                --     else
                --         if client.server_capabilities.inlayHintProvider then
                --             vim.g.inlay_hints_visible = true
                --             vim.lsp.inlay_hint(bufnr, true)
                --         else
                --             print("no inlay hints available")
                --         end
                --     end
                -- end

                opts.desc = "Show workspace diagnostics"
                keymap.set("n", "gW", "<cmd>Telescope diagnostics<CR>", opts)

                opts.desc = "Show workspace diagnostics"
                keymap.set("n", "<leader>lwd", "<cmd>Telescope diagnostics<CR>", opts)

                opts.desc = "Show buffer diagnostics"
                keymap.set("n", "<leader>lD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

                opts.desc = "Show line diagnostics"
                keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)

                opts.desc = "Restart LSP"
                keymap.set("n", "<leader>lrs", ":LspRestart<CR>", opts)

            end
        })

        --- Used to enable auto complete
        -- local capabilities = cmp_nvim_lsp.default_capabilities()
        local capabilities = vim.lsp.protocol.make_client_capabilities()

        capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities({}, false))

        -- capabilities = vim.tbl_deep_extend('force', capabilities, {
        --     textDocument = {
        --         foldingRange = {
        --             dynamicRegistration = false,
        --             lineFoldingOnly = true
        --         }
        --     }
        -- })

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

        if vim.env.NIX_PATH then

            vim.lsp.config("roslyn_ls", {
                -- capabilities =capabilities,
                -- on_attach = function()
                    -- print("This will run when the server attaches!")
                -- end,
                settings = {
                    ["csharp|inlay_hints"] = {
                        csharp_enable_inlay_hints_for_implicit_object_creation = true,
                        csharp_enable_inlay_hints_for_implicit_variable_types = true,
                    },
                    ["csharp|code_lens"] = {
                        dotnet_enable_references_code_lens = true,
                    },
                },
            })
            vim.lsp.enable("roslyn_ls")

            vim.lsp.config("lua_ls", {
                -- capabilities = capabilities,

                settings = {
                    Lua = {
                        hint = { enable = true },
                        diagnostics = {
                            global = { "vim" },
                        },
                        workspace = {
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            },
                            checkThirdParty = false
                        },
                    },
                },
            })
            vim.lsp.enable("lua_ls")

            vim.lsp.config("nil_ls", {
                -- capabilities = capabilities
            }) -- nix lsp
            vim.lsp.enable("nil_ls")

        else

            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    lspconfig(server_name).setup({
                        capabilities = capabilities,
                    })
                end,

                ["omnisharp"] = function ()
                    lspconfig("omnisharp", {
                        handlers = {
                            ["textDocument/definition"] = function(...)
                                return require("omnisharp_extended").handler(...)
                            end,
                        },
                        keys = {
                            {
                                "gd",
                                function()
                                    require("omnisharp_extended").telescope_lsp_definitions()
                                end,
                                desc = "Goto Definition",
                            },
                        },
                        capabilities = capabilities,
                        -- enable_roslyn_analyzers = true,
                        -- organize_imports_on_format = true,
                        enable_import_completion = true,
                        on_attach = function ()
                            vim.bo.indentexpr = ""
                            vim.bo.cindent = true
                        end
                    })
                end,

                -- example of how to overide the default setup
                ["rust_analyzer"] = function ()
                    lspconfig("rust_analyzer", {
                        settings = {
                            ["rust-analyzer"] = {
                                cargo = {
                                    allFeatures = true,
                                    loadOutDirsFromCheck = true,
                                    runBuildScripts = true,
                                },
                                check = "clippy",
                                -- Add clippy lints for Rust.
                                checkOnSave = {
                                    allFeatures = true,
                                    command = "clippy",
                                    extraArgs = { "--no-deps" },
                                },
                                procMacro = {
                                    enable = true,
                                    ignored = {
                                        ["async-trait"] = { "async_trait" },
                                        ["napi-derive"] = { "napi" },
                                        ["async-recursion"] = { "async_recursion" },
                                    },
                                },
                            }
                        },
                        capabilities = capabilities,
                    })
                end,

                ["lua_ls"] = function()
                    lspconfig("lua_ls", {
                        capabilities = capabilities,

                        settings = {
                            Lua = {
                                hint = { enable = true },
                                diagnostics = {
                                    global = { "vim" },
                                },
                                workspace = {
                                    library = {
                                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                    },
                                    checkThirdParty = false
                                },
                            },
                        },
                    })
                end

            })
        end
    end,
},  {
        "folke/neodev.nvim",
        dependencies = "neovim/nvim-lspconfig",
        ft = {"lua"},
        config = true
    },{
        "williamboman/mason.nvim",
        cmd = "Mason",
        config = true
    },--{
    --     "seblyng/roslyn.nvim",
    --     ---@module 'roslyn.config'
    --     ---@type RoslynNvimConfig
    --     opts = {
    --         -- your configuration comes here; leave empty for default settings
    --     },
    -- },
}

