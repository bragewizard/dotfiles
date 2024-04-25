---@class ChadrcConfig
local M = {}
M.ui =
{
    theme = 'aquarium',
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
        aquarium = {
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
                green = "#bee3b6",
                vibrant_green = "#8fd4cb",
                nord_blue = "#8b9bcd",
                blue = "#a1b1e3",
                yellow = "#F1FA8C",
                sun = "#FFFFA5",
                purple = "#BD93F9",
                dark_purple = "#BD93F9",
                teal = "#92a2d4",
                orange = "#FFB86C",
                cyan = "#8fd4cb",
                statusline_bg = "#2d2f3b",
                lightbg = "#41434f",
                pmenu_bg = "#b389ef",
                folder_bg = "#bee3b6",
            },
            base_16 = {
                base00 = "#292830",
                base01 = "#383946",
                base02 = "#4d4f68",
                base03 = "#626483",
                base04 = "#83a598",
                base05 = "#fff4e6",
                base06 = "#fff4e6",
                base07 = "#fff4e6",
                base08 = "#bee3b6",
                base09 = "#FFB86C",
                base0A = "#ff86d3",
                base0B = "#fff4e6",
                base0C = "#8fd4cb",
                base0D = "#BD93F9",
                base0E = "#a1b1e3",
                base0F = "#fff4e6",
            },
        }
    }
}
M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"
M.init = require "custom.init"
return M
