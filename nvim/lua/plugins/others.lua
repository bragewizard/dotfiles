return {
    { "nvim-lua/plenary.nvim" },
    {
        "tpope/vim-surround",
        lazy = false,
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
                width = 130,
            },
        },
        cmd = { 'ZenMode' },
        keys = { { '<leader>tz', desc = "Toggle Zen Mode" } },
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
            leap.opts.special_keys.prev_target = '<backspace>'
            require('leap.user').set_repeat_keys('<enter>', '<backspace>')
        end,
    },
}
