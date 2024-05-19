local M = {}

M.options = {
    nvchad_branch = "v2.0",
}

M.ui = {
    ------------------------------- base46 -------------------------------------
    -- hl = highlights
    hl_add = {},
    theme_toggle = { "onedark", "one_light" },
    transparency = false,
    lsp_semantic_tokens = false, -- needs nvim v0.9, just adds highlight groups for lsp semantic tokens
    theme = 'aquarium',

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
                black = "#292830",  --  nvim bg
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
                yellow = "#eeea99",
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
                base09 = "#f9e4bc",
                base0A = "#8fd4cb",
                base0B = "#f9e4bc",
                base0C = "#ff86d3",
                base0D = "#BD93F9",
                base0E = "#a1b1e3",
                base0F = "#fff4e6",
            },
        }
    },
    -- https://github.com/NvChad/base46/tree/v2.0/lua/base46/extended_integrations
    extended_integrations = {}, -- these aren't compiled by default, ex: "alpha", "notify"

    -- cmp themeing
    cmp = {
        icons = true,
        lspkind_text = true,
        style = "default",            -- default/flat_light/flat_dark/atom/atom_colored
        border_color = "grey_fg",     -- only applicable for "default" style, use color names from base30 variables
        selected_item_bg = "colored", -- colored / simple
    },

    telescope = { style = "borderless" }, -- borderless / bordered

    ------------------------------- nvchad_ui modules -----------------------------
    statusline = {
        theme = "default", -- default/vscode/vscode_colored/minimal
        -- default/round/block/arrow separators work only for default statusline theme
        -- round and block will work for minimal theme only
        separator_style = "default",
        overriden_modules = nil,
    },

    -- lazyload it when there are 1+ buffers
    tabufline = {
        show_numbers = false,
        enabled = true,
        lazyload = true,
        overriden_modules = nil,
    },

    -- nvdash (dashboard)
    nvdash = {
        load_on_startup = true,

        header = {
            "      >_ NEOVIM         ",
        },

        buttons = {
            { ">  Find File", "Spc f f", "Telescope find_files" },
            { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
            { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
            { "  Bookmarks", "Spc m a", "Telescope marks" },
            { "  Themes", "Spc t h", "Telescope themes" },
            { "  Mappings", "Spc c h", "NvCheatsheet" },
        },
    },

    cheatsheet = { theme = "grid" }, -- simple/grid

    lsp = {
        -- show function signatures i.e args as you type
        signature = {
            disabled = true,
            silent = true, -- silences 'no signature help available' message from appearing
        },
    },
}

M.plugins = ""                                    -- path i.e "custom.plugins", so make custom/plugins.lua file

M.lazy_nvim = require "plugins.configs.lazy_nvim" -- config for lazy.nvim startup options

M.mappings = require "core.mappings"

return M
