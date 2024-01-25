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
    -- changed_themes = {
    --     gruvbox = {
    --         base_16 = {
    --             -- base00 = "#202020",
    --             -- base01 = "#ffffff",
    --             -- base02 = "#ffffff",
    --             -- base03 = "#ffffff",
    --             -- base04 = "#ffffff",
    --             -- base05 = "#ffffff",
    --             -- base06 = "#ffffff",
    --             -- base07 = "#ffffff",
    --             -- base08 = "#ffffff",
    --             -- base09 = "#ffffff",
    --         },
    --         base_30 = {
    --             -- red = "#282828",
    --             -- white = "#282828",
    --             -- black = "#282828",
    --             -- yellow = "#282828",
    --             -- dark_yellow = "#282828",
    --             -- dark_black = "#282828",
    --             -- folder_bg = "#ffffff",
    --             -- folder_fg = "#ffffff",
    --             -- pmenu_bg = "#ffffff",
    --             -- statusline_bg = "#ffffff",
    --             -- one_bg = "#ffffff",
    --             -- one_bg2 = "#ffffff",
    --             -- one_bg3 = "#ffffff",
    --             -- line = "#ffffff",
    --         },
    --     },
    -- },
}
M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"
M.init = require "custom.init"
return M
