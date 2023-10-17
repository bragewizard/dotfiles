local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")



vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        underline = false,
        -- update_in_insert = false,
        -- signs = false
    }
)





lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"python"},
    settings =
        {
            pyright = { autoImportCompletion = true },
            python =
                {
                    analysis = { typeCheckingMode = 'off'}
                }
        }
})


lspconfig.clangd.setup({
    on_attach = function(client, bufnr)
        client.server_capabilities.signatureHelpProvider = false
        on_attach(client, bufnr)
    end,
    cmd =
    {
        "clangd",
        "--clang-tidy",
        -- "--query-driver=/usr/bin/avr-gcc",
        -- "--compile-commands-dir=./"
    },
    capabilities = capabilities,
})
