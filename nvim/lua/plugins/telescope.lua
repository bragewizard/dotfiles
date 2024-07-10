return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
        },
        cmd = "Telescope",
        opts = {
            defaults = {
                vimgrep_arguments = {
                    "rg",
                    "-L",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                },
                prompt_prefix = "🔍 ",
                selection_caret = "  ",
                entry_prefix = "  ",
                initial_mode = "normal",
                selection_strategy = "reset",
                sorting_strategy = "descending",
                layout_strategy = "flex",
                file_ignore_patterns = { "node_modules" },
                path_display = { "truncate" },
                winblend = 0,
                border = {},
                borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                color_devicons = true,
                set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
                mappings = {
                    n = { ["q"] = require("telescope.actions").close },
                },
            },

            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    sort_lastused = true,
                    case_mode = "smart_case",
                },
                file_browser = {
                    theme = "ivy",
                    -- disables netrw and use telescope-file-browser in its place
                    hijack_netrw = true,
                    -- mappings = {
                    --     ["i"] = {
                    --         -- your custom insert mode mappings
                    --     },
                    --     ["n"] = {
                    --         -- your custom normal mode mappings
                    --     },
                    -- },
                },
            },
            pickers = {
                buffers = {
                    ignore_current_buffer = false,
                    sort_lastused = true,
                }
            },
        },
        config = function(_, opts)
            local telescope = require("telescope")
            telescope.setup(opts)
            telescope.load_extension("file_browser")
            telescope.load_extension("fzf")
        end,
    },
}
