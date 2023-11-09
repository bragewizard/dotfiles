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
        client.server_capabilities.signatureHelpProvider = true
        on_attach(client, bufnr)
    end,
    capabilities = capabilities,
    -- cmd =
    -- {
        -- "clangd",
        -- "--background-index",
        -- "--clang-tidy",
        -- "--completion-style=bundled",
        -- "--header-insertion=iwyu",
        -- "--suggest-missing-includes",
        -- "--cross-file-rename",
        -- "--query-driver=/usr/bin/avr-gcc",
        -- "--query-driver=/opt/microchip/xc32/v4.35.bin/xc32-g++",
    -- },
})



-- lspconfig.ccls.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
-- })
