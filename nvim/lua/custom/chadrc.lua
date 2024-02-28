---@type ChadrcConfig 
local M = {}
M.ui =
{
    theme = 'gruvbox',
    lsp = {
        signature = {
            disabled = true
        },
    },
    hl_override = {
        Comment = { italic = true },
        -- AlphaHeader = { fg = "blue" },
        -- CursorLine = { bg = "black2", },
        Statement = { italic = true, },
        -- Define = { italic = true },
        -- eliixirString = { italic = true },
        Include = { italic = true },
        -- TSVariable = { italic = true },
        -- Variable = { italic = true },
        -- Type = { italic = true },
        -- Function = { italic = true },
        Keyword = { italic = true },
        -- TSKeyword = { italic = true },
        -- TSMethod = { italic = true },
        -- TSDefine = { italic = true },
        -- SpecialComment = { italic = true },
        -- Pmenu = { bg = "white" },
        -- Pmenu = { bg = "#ffffff" }, this works too

        -- if you want to lighten or darken color
        -- this will use the black colorf rom nvchad theme & lighten it by 2x
        -- use a negative number to darken it
        -- MyHighlightGroup = { -- custom highlights are also allowed
        --     fg = "red",
        --     bg = "#ffffff"
        -- },  
        -- Normal = { bg = "#282828" },

    },
    changed_themes = {
        gruvbox = {
            base_30 = {
                white = "#ebdbb2",
                darker_black = "#232323",
                black = "#282828", --  nvim bg
                black2 = "#2e2e2e",
                one_bg = "#353535",
                one_bg2 = "#3f3f3f",
                one_bg3 = "#444444",
                grey = "#4b4b4b",
                grey_fg = "#4e4e4e",
                grey_fg2 = "#505050",
                light_grey = "#656565",
                red = "#fb4934",
                baby_pink = "#cc241d",
                pink = "#ff75a0",
                line = "#36393a", -- for lines like vertsplit
                green = "#b8bb26",
                vibrant_green = "#a9b665",
                nord_blue = "#83a598",
                blue = "#458588",
                yellow = "#d79921",
                sun = "#fabd2f",
                purple = "#b4bbc8",
                dark_purple = "#d3869b",
                teal = "#749689",
                orange = "#e78a4e",
                cyan = "#82b3a8",
                statusline_bg = "#2c2c2c",
                lightbg = "#3d3d3d",
                pmenu_bg = "#83a598",
                folder_bg = "#749689",
            },

            base_16 = {
                base00 = "#282828",
                base01 = "#3c3836",
                base02 = "#423e3c",
                base03 = "#484442",
                base04 = "#bdae93",
                base05 = "#d5c4a1",
                base06 = "#ebdbb2",
                base07 = "#fbf1c7",

                -- base08 = "#8ec07c",
                -- base08 = "#d79921",
                -- base08 = "#b8bb26",
                base08 = "#fabd2f",
                -- base08 = "#fe8019",

                base09 = "#fe8019",
                -- base09 = "#fb4934",

                -- base0A = "#fabd2f",
                base0A = "#8ec07c", -- good

                base0B = "#b8bb26", -- good

                -- base0C = "#8ec07c",
                base0C = "#83a598",
                -- base0C = "#d65d0e",
                -- base0C = "#fb4934",
                -- base0C = "#fabd2f",
                -- base0C = "#a9b665",
                -- base0C = "#d79921",

                base0D = "#83a598",
                base0E = "#d3869b",
                base0F = "#d65d0e",
            }
        }
    }
}
M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"
M.init = require "custom.init"
return M
