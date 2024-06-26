return {
    {
        "neovim/nvim-lspconfig",
        init = function()
            require("utils").lazy_load "nvim-lspconfig"
        end,
        config = function()
            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics, {
                    virtual_text = true,
                    underline = false,
                    update_in_insert = true,
                    -- signs = false
                }
            )
            local on_attach = function(client, bufnr)
                client.server_capabilities.documentFormattingProvider = true
                client.server_capabilities.documentRangeFormattingProvider = true


                if not client.supports_method "textDocument/semanticTokens" then
                    client.server_capabilities.semanticTokensProvider = nil
                end
            end

            local capabilities = vim.lsp.protocol.make_client_capabilities()

            capabilities.textDocument.completion.completionItem = {
                documentationFormat = { "markdown", "plaintext" },
                snippetSupport = true,
                preselectSupport = true,
                insertReplaceSupport = true,
                labelDetailsSupport = true,
                deprecatedSupport = true,
                commitCharactersSupport = true,
                tagSupport = { valueSet = { 1 } },
                resolveSupport = {
                    properties = {
                        "documentation",
                        "detail",
                        "additionalTextEdits",
                    },
                },
            }

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup {
                on_attach = on_attach,
                capabilities = capabilities,

                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = {
                                [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                                [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                                [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
                                [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
                            },
                            maxPreload = 100000,
                            preloadFileSize = 10000,
                        },
                    },
                },
            }

            lspconfig.pyright.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                filetypes = { "python" },
                settings =
                {
                    pyright = { autoImportCompletion = true },
                    python =
                    {
                        analysis = { typeCheckingMode = 'off' }
                    }
                }
            })

            lspconfig.rust_analyzer.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                filetypes = { "rust" },
            })

            lspconfig.wgsl_analyzer.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                filetypes = { "wgsl" },
            })

            lspconfig.zls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                filetypes = { "zig" },
            })

            lspconfig.ccls.setup({
                init_options = { documentFormatting = true },
                on_attach = on_attach,
                capabilities = capabilities,
                filetypes = { "c", "cpp", "objc", "objcpp" },
                settings = {
                    rootMarkers = { ".ccls", ".git/" },
                },
            })

            lspconfig.typst_lsp.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                filetypes = { "typ" },
                -- settings = {
                -- exportPdf = "onType"
                -- }
            })
        end,
    },
}
