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
        config = function(_)
            local telescope = require("telescope")
            local fb_actions = require("telescope").extensions.file_browser.actions
            local actions = require("telescope.actions")
            telescope.setup({
                defaults = {
                    vimgrep_arguments = {
                        "rg",
                        "-L",
                        -- "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                    },
                    prompt_prefix = "🔍 ",
                    selection_caret = "> ",
                    entry_prefix = "  ",
                    initial_mode = "normal",
                    selection_strategy = "reset",
                    sorting_strategy = "descending",
                    layout_strategy = "flex",
                    file_ignore_patterns = { "node_modules" },
                    path_display = { "truncate" },
                    -- winblend = 0,
                    -- border = {},
                    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                    color_devicons = true,
                    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
                    mappings = {
                        n = {
                            ["q"] = actions.close,
                            ["l"] = actions.select_default,
                        },
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                    file_browser = {
                        theme = "ivy",
                        -- disables netrw and use telescope-file-browser in its place
                        hijack_netrw = true,
                        mappings = {
                            ["n"] = {
                                ["h"] = fb_actions.goto_parent_dir,
                                ["."] = fb_actions.toggle_hidden,
                                ['a'] = fb_actions.create,
                            },
                        },
                    },
                },
                pickers = {
                    buffers = {
                        ignore_current_buffer = false,
                        sort_lastused = true,
                        sort_mru = true,
                    },
                },
            })
            telescope.load_extension("fzf")
            telescope.load_extension("file_browser")
        end,
    },
}
