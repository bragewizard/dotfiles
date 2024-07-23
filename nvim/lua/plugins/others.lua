return {
    { "nvim-lua/plenary.nvim" },
    {
        "lambdalisue/vim-suda",
        cmd = { "SudaRead", "SudaWrite" },
    },
    {
        "folke/which-key.nvim",
        keys = { "<leader>", "<c-r>", '"', "'", "`", "c", "v", "g" },
        cmd = "WhichKey",
        config = function(_, opts)
            require("which-key").setup(opts)
        end,
    },
    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup()
        end,
    },
    {
        "folke/zen-mode.nvim",
        opts = {
            window = {
                width = 150,
            },
        },
        cmd = { 'ZenMode' },
    },
    {
        "lervag/vimtex",
        ft = { "tex", "md" },
    },
    {
        "kaarmu/typst.vim",
        ft = { "typst" },
    },
    {
        "ggandor/leap.nvim",
        lazy = false,
        config = function()
            local leap = require('leap')
            leap.opts.equivalence_classes = { ' \t\r\n', '([{', ')]}', '\'"`' }
            leap.opts.special_keys.prev_target = '<backspace>'
            -- leap.opts.special_keys.prev_group = '<backspace>'
            require('leap.user').set_repeat_keys('<enter>', '<backspace>')

        end,
    },
}
