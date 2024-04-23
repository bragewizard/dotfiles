---@class ChadrcConfig
local M = {}
M.ui =
{
    theme = 'chadracula',
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
        Define = { italic = true },
        -- eliixirString = { italic = true },
        Include = { italic = true },
        -- TSVariable = { italic = true },
        -- Variable = { italic = true },
        -- Type = { italic = true },
        -- Function = { italic = true },
        Keyword = { italic = true },
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
                base08 = "#8ec07c",
                -- base08 = "#fabd2f",
                base09 = "#fe8019",
                base0A = "#fabd2f",
                base0B = "#b8bb26", -- good
                base0C = "#83a598",
                base0D = "#83a598",
                base0E = "#d3869b",
                base0F = "#d65d0e",
            },
        },
        chadracula = {
            base_30 = {
                white = "#F8F8F2",
                darker_black = "#24232A",
                black = "#292830", --  nvim bg
                black2 = "#2d303e",
                one_bg = "#373844", -- real bg of onedark
                one_bg2 = "#34374a",
                one_bg3 = "#565761",
                grey = "#5e5f69",
                grey_fg = "#666771",
                grey_fg2 = "#6e6f79",
                light_grey = "#73747e",
                red = "#ff7070",
                baby_pink = "#ff86d3",
                pink = "#FF79C6",
                line = "#3c3d49", -- for lines like vertsplit
                green = "#50fa7b",
                vibrant_green = "#5dff88",
                nord_blue = "#8b9bcd",
                blue = "#a1b1e3",
                yellow = "#F1FA8C",
                sun = "#FFFFA5",
                purple = "#BD93F9",
                dark_purple = "#BD93F9",
                teal = "#92a2d4",
                orange = "#FFB86C",
                cyan = "#8BE9FD",
                statusline_bg = "#2d2f3b",
                lightbg = "#41434f",
                pmenu_bg = "#b389ef",
                folder_bg = "#3BDBA4",
            },
            base_16 = {
                base00 = "#292830",
                base01 = "#383946",
                base02 = "#4d4f68",
                base03 = "#626483",
                base04 = "#83a598",
                base05 = "#e9e9f4",
                base06 = "#f1f2f8",
                base07 = "#f7f7fb",
                base08 = "#ebdbb2",
                base09 = "#FFB86C",
                base0A = "#a1b1e3",
                base0B = "#fbf1c7",
                base0C = "#8BE9FD",
                base0D = "#BD93F9",
                base0E = "#ff75a0",
                base0F = "#F8F8F2",
            }
        }
    }
}
M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"
M.init = require "custom.init"
return M
