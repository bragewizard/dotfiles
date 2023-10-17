---@type ChadrcConfig 
local M = {}
M.ui =
{
    theme = 'penumbra_dark',
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
        -- Keyword = { italic = true },
        -- TSKeyword = { italic = true },
        -- TSMethod = { italic = true },
        -- TSDefine = { italic = true },
        -- SpecialComment = { italic = true },
        -- Pmenu = { bg = "white" },
        -- Pmenu = { bg = "#ffffff" }, this works too

        -- if you want to lighten or darken color
        -- this will use the black colorf rom nvchad theme & lighten it by 2x
        -- use a negative number to darken it
        -- Normal = { bg = {"black", 8} },
        -- MyHighlightGroup = { -- custom highlights are also allowed
        --     fg = "red",
        --     bg = "darker_black"
        -- }   
        changed_themes = {
            onedark = {
                base_16 = {
                    -- base00 = "#mycol",
                },
                base_30 = {
                    -- red = "#mycol",
                    -- white = "#mycol",
                },
            },

            nord = {
                -- and so on!
            },
        },


    },
}
M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"
M.init = require "custom.init"
return M
