return {
    {
        'AlexvZyl/nordic.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            local pal = require 'nordic.colors'
            require 'nordic' .setup({
                on_palette = function(palette)
                    palette.gray0 = '#242932'
                    return palette
                end,
                bold_keywords = false,
                italic_comments = true,
                transparent_bg = false,
                bright_border = false,
                reduced_blue = true,
                swap_backgrounds = false,
                override = {
                    CursorLine = { bg = pal.black1 },
                    Visual = { bg = pal.black1 },
                    StatusLine = { bg = pal.black1 },
                    WinSeparator = { bg = '#242932' },
                    VertSplit = { bg = '#242932' },
                    TelescopePromptTitle = {
                        bg = pal.yellow.base,
                    },
                    TelescopeResultsTitle = {
                        bg = pal.yellow.base,
                    },
                    TelescopeSelection = {
                        bg = pal.gray2,
                    },
                    TelescopeSelectionCaret = {
                        fg = pal.yellow.base,
                        bg = pal.gray2,
                    },
                },
                cursorline = {
                    bold = false,
                    bold_number = true,
                    theme = 'dark',
                    blend = 0.85,
                },
                noice = {
                    style = 'classic',
                },
                telescope = {
                    style = 'flat',
                },
                leap = {
                    dim_backdrop = false,
                },
                ts_context = {
                    dark_background = true,
                }
            })
            -- load the configuration
            require 'nordic' .load()
        end
    },
}
