return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("noice").setup({
                -- timeout = 10000,
                -- stages = 'static',
                lsp = {
                    progress = {
                        enabled = true,
                        -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
                        -- See the section on formatting for more details on how to customize.
                        --- @type NoiceFormat|string
                        format = "lsp_progress",
                        --- @type NoiceFormat|string
                        format_done = "lsp_progress_done",
                        throttle = 1000 / 30, -- frequency to update lsp progress message
                        view = "mini",
                    },
                    override = {
                        -- override the default lsp markdown formatter with Noice
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
                        -- override the lsp markdown formatter with Noice
                        ["vim.lsp.util.stylize_markdown"] = false,
                        -- override cmp documentation with Noice (needs the other options to work)
                        ["cmp.entry.get_documentation"] = false,
                    },
                    hover = {
                        enabled = true,
                        silent = false, -- set to true to not show a message if hover is not available
                        view = nil,     -- when nil, use defaults from documentation
                        ---@type NoiceViewOptions
                        opts = {},      -- merged with defaults from documentation
                    },
                    signature = {
                        enabled = true,
                        auto_open = {
                            enabled = false,
                            trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
                            luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
                            throttle = 50,  -- Debounce lsp signature help request by 50ms
                        },
                        view = nil,         -- when nil, use defaults from documentation
                        ---@type NoiceViewOptions
                        opts = {},          -- merged with defaults from documentation
                    },
                    message = {
                        -- Messages shown by lsp servers
                        enabled = true,
                        view = "notify",
                        opts = {},
                    },
                    -- defaults for hover and signature help
                    documentation = {
                        view = "hover",
                        ---@type NoiceViewOptions
                        opts = {
                            lang = "markdown",
                            replace = true,
                            render = "plain",
                            format = { "{message}" },
                            win_options = { concealcursor = "n", conceallevel = 3 },
                        },
                    },
                },
                -- you can enable a preset for easier configuration
                presets = {
                    bottom_search = true,         -- use a classic bottom cmdline for search
                    command_palette = true,       -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = true,        -- add a border to hover docs and signature help
                },
                cmdline = {
                    enabled = true,         -- enables the Noice cmdline UI
                    view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
                    opts = {},              -- global options for the cmdline. See section on views
                    ---@type table<string, CmdlineFormat>
                    format = {
                        -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
                        -- view: (default is cmdline view)
                        -- opts: any options passed to the view
                        -- icon_hl_group: optional hl_group for the icon
                        -- title: set to anything or empty string to hide
                        cmdline = { pattern = "^:", icon = "_", lang = "vim" },
                        search_down = { kind = "search", pattern = "^/", icon = "🔍", lang = "regex", view = "cmdline_popup", icon_hl_group = "Search" },
                        search_up = { kind = "search", pattern = "^%?", icon = "🔍", lang = "regex", view = "cmdline_popup", icon_hl_group = "Search" },
                        filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
                        lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
                        help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
                        input = { view = "cmdline_input", icon = "󰥻 " }, -- Used by input()
                        -- lua = false, -- to disable a format, set to `false`
                    },
                },

                views = {
                    cmdline_popup = {
                        position = {
                            row = "50%",
                            col = "50%",
                        },
                        size = {
                            width = 60,
                            height = "auto",
                        },
                    },
                    popupmenu = {
                        relative = "editor",
                        position = {
                            row = 8,
                            col = "50%",
                        },
                        size = {
                            width = 60,
                            height = 10,
                        },
                        border = {
                            style = "rounded",
                            padding = { 0, 1 },
                        },
                        win_options = {
                            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
                        },
                    },
                },
            })
        end,
    },
}
