return {
    {
        'stevearc/conform.nvim',
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                -- Conform will run multiple formatters sequentially
                python = { "isort", "black" },
                -- Use a sub-list to run only the first available formatter
                javascript = { { "prettierd", "prettier" } },
            },
            config = function (_,opts)
                require('conform').setup(opts)
            end
        },
    }
}
